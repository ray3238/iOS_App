//
//  ViewController.swift
//  CircleProgressBar
//
//  Created by 이태규 on 11/15/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        protocol GestureProtocol {
            func 탭()
            func 꾸욱누르기()
            func 더블탭()
        }
        
        class GestureBtn: GestureProtocol {
            func 탭() {}
            func 꾸욱누르기() {}
            func 더블탭() {}
        }
        
        class DoubleTapBtn: GestureProtocol {
            func 탭() {}
            
            //사용하지 않는 함수
            func 꾸욱누르기() {}
            func 더블탭() {}
            
        }
        //        after : 프로토콜을 분리함으로써 필요한 프로토콜만 채택하게 되어 사용하지 않는 메소드가 없어졌다.
        
        protocol TapGestureProtocol {
            func 탭()
        }
        
        protocol LongTapGestureProtocol {
            func 꾸욱누르기()
        }
        
        protocol DoubleTapGestureProtocol {
            func 더블탭()
        }
        
        class GestureBtn: TapGestureProtocol, LongTapGestureProtocol, DoubleTapGestureProtocol {
            func 탭() {}
            func 꾸욱누르기() {}
            func 더블탭() {}
        }
        
        class DoubleTapBtn: GestureProtocol {
            func 더블탭() {}
        }
        
        class LongAndTapBtn: LongTapGestureProtocol, TapGestureProtocol {
            func 탭() {}
            func 꾸욱누르기() {}
        }
        
        func doSomething(button: DoubleTapGestureProtocol & LongTapGestureProtocol) {
            button.더블탭()
            button.꾸욱누르기()
        }
    }
    
    
    
    
    
}
