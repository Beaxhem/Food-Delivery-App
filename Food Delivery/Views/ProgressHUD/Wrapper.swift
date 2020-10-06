//
//  Wrapper.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 05.10.2020.
//
import JGProgressHUD
import SwiftUI

class ProgressHUDController: UIViewController {
    @EnvironmentObject var hudController: HUDController
    
    let hud = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.dismiss()
    }
    
    func show(text: String, afterDelay delay: TimeInterval?) {
        hud.textLabel.text = text
        hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        hud.show(in: self.view)
        
        guard let delay = delay else {
            return
        }
        
        hud.dismiss(afterDelay: delay)
    }
    
    func dismiss() {
        hud.dismiss()
    }
}

struct ProgressHUD: UIViewControllerRepresentable {
    var text: String
    var delay: TimeInterval?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ProgressHUD>) -> ProgressHUDController {
        ProgressHUDController()
    }
    
    func updateUIViewController(_ uiViewController: ProgressHUDController, context: UIViewControllerRepresentableContext<ProgressHUD>) {
        uiViewController.show(text: text, afterDelay: delay)
    }
    
    typealias UIViewControllerType = ProgressHUDController
}

public struct ProgressHUDView<Content>: View where Content: View {
    private var isShowing: Bool
    private var content: () -> Content
    private var text: String
    private var delay: TimeInterval?
    
    init(isShowing: Bool, text: String, afterDelay delay: TimeInterval? = nil, content: @escaping () -> Content) {
        self.isShowing = isShowing
        self.content = content
        self.text = text
        self.delay = delay
    }
    
    public var body: some View {
        ZStack(alignment: .center) {
            if (!self.isShowing) {
                self.content()
            } else {
                self.content()
                    .disabled(true)
                    .blur(radius: 3)
                
                ProgressHUD(text: self.text, delay: delay)
            }
        }
    }
}

class HUDController: ObservableObject {
    @Published var isShowing = false
    @Published var text = ""
    @Published var delay: TimeInterval? = nil
    
    func show(text: String, afterDelay delay: TimeInterval? = nil) {
        self.isShowing = true
        self.text = text
        self.delay = delay
        
        guard let delay = delay else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let strongSelf = self else {
                return
            }
            withAnimation {
                strongSelf.isShowing = false
            }
            
        }
    }
}
