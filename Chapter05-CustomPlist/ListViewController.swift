//
//  ListViewController.swift
//  Chapter05-CustomPlist
//
//  Created by 한규철 on 4/8/R4.
//

import UIKit

class ListViewController : UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var account: UITextField!
    
    //피커 뷰를 닫아주는 역할
    @objc func pickerDone(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    var accountlist = ["sqlpro@naver.com",
            "webmaster@rubypaper.co.kr",
            "abc1@gmail.com",
            "abc2@gmail.com",
            "abc3@gmail.com"]
    
    
    override func viewDidLoad() {
        let picker = UIPickerView()
        
        //피커 뷰의 델리게이트 지정
        picker.delegate = self
        //account 텍스트 필드 입력 방식을 가상 키보드 대신 피커 뷰로 설정
        self.account.inputView = picker
        
        //툴바 객체 정의
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: 0, height: 35)
        toolbar.barTintColor = .lightGray
        
        //액세서리 영역에 툴바를 표시
        self.account.inputAccessoryView = toolbar
        
        //툴바에 들어갈 닫기 버튼
        let done = UIBarButtonItem()
        done.title = "Done"
        done.target = self
        done.action = #selector(pickerDone)
        
        //버튼을 툴 바에 추가
        toolbar.setItems([done], animated: true)
        
       
    }
    
    //생성할 컴포넌트의 개수를 정의합니다
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //지정된 컴포넌트가 가질 목록의 길이를 정의합니다
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.accountlist.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.accountlist[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //선택된 계정값을 텍스트 필드에 입력
        let account = self.accountlist[row] //선택된계정
        self.account.text = account
        
       
    }
}
