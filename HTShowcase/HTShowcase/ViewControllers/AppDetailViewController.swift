//
//  AppDetailViewController.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/31/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AppDetailViewController: BaseViewController {
   
    //MARK: - IBOutlets
    
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var appDescriptionLabel: UILabel!
    
    //MARK: - Vars
    
    let disposedBag = DisposeBag()
    let viewModel: AppDetailViewModel
    
    //MARK: - LifeCycle
    
    init(viewModel: AppDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }
    
    //MARK: - Setup
    
    func setupBindings() {
        viewModel.app.do(onNext: { (app) in
            self.title = app.name

            self.appDescriptionLabel.adjustsFontSizeToFitWidth = true
            self.appDescriptionLabel.text = app.description
            self.appImageView.setImage(withStringURL: app.imageURL)
        }).subscribe()
            .disposed(by: disposedBag)
    }

}
