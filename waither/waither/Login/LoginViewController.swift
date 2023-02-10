//
//  LoginViewController.swift
//  waither
//
//  Created by eunseo on 2023/01/15.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginByEmailLabel: UIButton!
    
    @IBOutlet weak var signinByEmailBtn: UIButton!
    
    @IBOutlet weak var kakaoLoginBtn: UIButton!
    @IBOutlet weak var appleLoginBtn: UIButton!
    
    @IBOutlet weak var withoutLoginLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginLabel.addCharacterSpacing()

        loginByEmailLabel.addTextSpacing(-1)
        withoutLoginLabel.addTextSpacing(-1)
        signinByEmailBtn.addTextSpacing(-1)
        
        
        signinByEmailBtn.layer.borderWidth = 1
        signinByEmailBtn.layer.borderColor = UIColor.main_blue?.cgColor
        signinByEmailBtn.layer.cornerRadius = 4
        
        kakaoLoginBtn.layer.cornerRadius = 4
        appleLoginBtn.layer.cornerRadius = 4
        
        withoutLoginLabel.addTarget(self, action: #selector(goAlert), for: .touchUpInside)
        

        kakaoLoginBtn.setImage(UIImage(named: "Kakao_logo"), for: .normal)
        kakaoLoginBtn.imageView?.contentMode = .scaleAspectFit
    }
    
    @IBAction func signupBtnClicked(_ sender: Any) {
        guard let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController")
        else{
                return
            }
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    @IBAction func loginByEmailBtnClicked(_ sender: Any) {
        guard let loginByEmailVC = self.storyboard?.instantiateViewController(identifier: "LoginByEmailViewController")
        else{
                return
            }
        self.navigationController?.pushViewController(loginByEmailVC, animated: true)
    }
    
    
    @objc func goAlert(){
            let alert = self.storyboard?.instantiateViewController(withIdentifier: "LoginPopupViewController") as! LoginPopupViewController
            alert.modalPresentationStyle = .overCurrentContext
            present(alert, animated: false, completion: nil)
        }
    
    @IBAction func loginByKakaoBtnClicked(_ sender: Any) {
        if (AuthApi.hasToken()) { //이미 로그인 했을 때
            UserApi.shared.accessTokenInfo { (accessTokenInfo, error) in
                if let error = error { // 토큰 없음 -> 재로그인
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        if (UserApi.isKakaoTalkLoginAvailable()){
                            self.kakaoLoginWithApp()
                        } else {
                            self.kakaoLoginWithAccount()
                        }
                    }
                    else {
                        //기타 에러
                    }
                }
                else { //로그인 이미 되어 있음 토큰 존재
                    self.getTokenInfo()
                }
            }
        }
        else { //처음 로그인
            if (UserApi.isKakaoTalkLoginAvailable()){
                self.kakaoLoginWithApp()
            } else {
                self.kakaoLoginWithAccount()
            }
        }
        
    }
    func kakaoLoginWithApp(){
        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    self.getTokenInfo()
                }
            }
    }
    
    func kakaoLoginWithAccount(){
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    self.getTokenInfo()
                }
            }
    }
    
    func getTokenInfo(){
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                UserApi.shared.accessTokenInfo {(accessTokenInfo, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("accessTokenInfo() success.")

                        guard let id = accessTokenInfo?.id else {return}
                        guard let name = user?.kakaoAccount?.profile?.nickname else {return}
                        guard let email = user?.kakaoAccount?.email else {return}
                        print("nickName : " + name
                              + "\n authId: " + String(id)
                              + "\n email:" + email)
                        
                        
                        self.postLogin(authId: String(id), nickname: name, email: email, provider: "kakao")
                        
                    }
                }
                
            }
        }
    }
    
    func postLogin(authId: String, nickname: String, email: String, provider: String) {

        // 넣는 순서도 순서대로여야 하는 것 같다.
//        let userInfo = LoginInfo(authId: authId, email: email, nickname: nickname, provider: provider)
//        guard let uploadData = try? JSONEncoder().encode(userInfo)
//        else {return}
        
        let authId = authId
        let nickname = nickname
        let email = email
        let provider = "kakao"
        let body = ["authId" : authId, "nickname" : nickname, "email" : email, "provider" : provider]
        let bodyData = try! JSONSerialization.data(withJSONObject: body, options: [])
                

        // URL 객체 정의
        let url = URL(string: "https://www.waither.shop/app/login")

        // URLRequest 객체를 정의
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        // HTTP 메시지 헤더
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = bodyData

        // URLSession 객체를 통해 전송, 응답값 처리
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            print("request\n ")

            // 서버가 응답이 없거나 통신이 실패
            if let e = error {
                print("An error has occured: \(e.localizedDescription)")
                return
            }
            // 응답 처리 로직
            DispatchQueue.main.async {
                        do{
                            let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                            guard let jsonObject = object else { return }
                            
                            //JSON 결과값을 추출
                            let status = jsonObject["status"] as? Int
                            let token = jsonObject["data"] as? String
                            
                            // 결과가 성공일 경우
                            if status == 200 {
                                print(token!)
                            }
                            
                        }catch let e as NSError{
                            
                            print("An error has occured while parsing JSONObject: \(e.localizedDescription)")
                            
                        }
                    }
                }
        // POST 전송
        task.resume()
    }
    
}



extension UIColor{
    static let main_blue = UIColor(named: "color-waither.blue")
    static let none_gray = UIColor(named: "color-waither.lightgray")
    static let main_gray = UIColor(named: "color-waither.gray")
    static let alert_red = UIColor(named: "color-waither.red")
}

extension UIButton{

    func addTextSpacing(_ letterSpacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }

}



