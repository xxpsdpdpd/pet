//
//  TermsAndConditionsVC.swift
//  testMenuDzng
//
//  Created by michail on 18.05.2023.
//

import UIKit
import WebKit

final class BaseTermsVC: BaseVC {
    @IBOutlet private weak var webView: WKWebView!
    
    private var termsType: TermsType?
    
    private var activityController: UIActivityViewController? {
        guard let url = termsType?.url else {
            return nil
        }
        
        return UIActivityViewController(activityItems: [url], applicationActivities: nil)
    }
    
    init(termsType: TermsType) {
        self.termsType = termsType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavView()
        configureWebView()
    }
    
    override func rightButtonAction() {
        shareAction()
    }
    
    private func configureNavView() {
        guard let image = AppAssets.share.image else { return }
        configureView(image: image)
    }
    
    private func configureWebView() {
        guard let url = termsType?.url else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }

    private func shareAction() {
        guard let activityController = activityController else { return }
        self.present(activityController, animated: true, completion: nil)
    }
}
