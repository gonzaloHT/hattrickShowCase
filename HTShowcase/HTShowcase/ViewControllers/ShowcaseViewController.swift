//
//  ShowcaseViewController.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/22/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ShowcaseViewController: UIViewController {
    
    enum ViewLayout {
        case common
        case squared
        case highImage
        
        static func getImageNameForViewLayout(viewLayout: ViewLayout) -> String {
            switch viewLayout {
            case .common: return "ShowcaseView-common"
            case .squared: return "ShowcaseView-squared"
            case .highImage: return "ShowcaseView-highImage"
            }
        }
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var showcaseCollectionView: UICollectionView!
    
    //MARK: - Vars
    
    var disposeBag = DisposeBag()
    var viewModel: ShowcaseViewModel
    var changeLayoutButton: UIBarButtonItem?
    var actualCellLayout: ViewLayout = .common
    var dataSource = Variable<[App]>([])
    
    //MARK: - LifeCycle
    
    init(viewModel: ShowcaseViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
    }
    
    //MARK: - Setup
    
    fileprivate func setupUI() {
        title = "Showcase"
        
        changeLayoutButton = UIBarButtonItem(image: UIImage(named: ViewLayout.getImageNameForViewLayout(viewLayout: .squared)), style: .plain, target: self, action:  #selector(changeView))
        navigationItem.rightBarButtonItem = changeLayoutButton;
        
        showcaseCollectionView.register(UINib(nibName: ShowcaseCollectionViewCell.cellNibName, bundle: nil), forCellWithReuseIdentifier: ShowcaseCollectionViewCell.cellReuseIdentifier)
        showcaseCollectionView.register(UINib(nibName: ShowcaseSquaredCollectionViewCell.cellNibName, bundle: nil), forCellWithReuseIdentifier: ShowcaseSquaredCollectionViewCell.cellReuseIdentifier)
        showcaseCollectionView.register(UINib(nibName: ShowcaseHighImageCollectionViewCell.cellNibName, bundle: nil), forCellWithReuseIdentifier: ShowcaseHighImageCollectionViewCell.cellReuseIdentifier)
        showcaseCollectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        showcaseCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    func setupBindings() {

        viewModel.apps.bind(to: dataSource).disposed(by: disposeBag)
        
        dataSource.asObservable().bind(to: showcaseCollectionView.rx.items) { (collectionView, row, element) in
            let indexPath = IndexPath(row: row, section: 0)
            switch self.actualCellLayout {
            case .common:
                let cell = self.showcaseCollectionView.dequeueReusableCell(withReuseIdentifier: ShowcaseCollectionViewCell.cellReuseIdentifier, for: indexPath) as! ShowcaseCollectionViewCell
                cell.setup(withApp: element)
                return cell
            case .squared:
                let cell = self.showcaseCollectionView.dequeueReusableCell(withReuseIdentifier: ShowcaseSquaredCollectionViewCell.cellReuseIdentifier, for: indexPath) as! ShowcaseSquaredCollectionViewCell
                cell.setup(withApp: element)
                return cell
            case .highImage:
                let cell = self.showcaseCollectionView.dequeueReusableCell(withReuseIdentifier: ShowcaseHighImageCollectionViewCell.cellReuseIdentifier, for: indexPath) as! ShowcaseHighImageCollectionViewCell
                cell.setup(withApp: element)
                return cell
            }
            }.disposed(by: disposeBag)
        
    }
    
    //MARK: - Actions
    
    @objc func changeView() {
        guard let changeLayoutButton = changeLayoutButton else {
            return
        }
        
        switch self.actualCellLayout {
        case .common:
            changeLayoutButton.image = UIImage(named: ViewLayout.getImageNameForViewLayout(viewLayout: .highImage))
            self.actualCellLayout = .squared
        case .squared:
            changeLayoutButton.image = UIImage(named: ViewLayout.getImageNameForViewLayout(viewLayout: .common))
            self.actualCellLayout = .highImage
        case .highImage:
            changeLayoutButton.image = UIImage(named: ViewLayout.getImageNameForViewLayout(viewLayout: .squared))
            self.actualCellLayout = .common
        }
        
        dataSource.value = dataSource.value
    }
    
}

extension ShowcaseViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch actualCellLayout {
        case .common:
            return CGSize(width: self.view.frame.width - 40, height: (self.view.frame.width - 40) / (330/125))
        case .squared:
            return CGSize(width: self.view.frame.width - 40, height: (self.view.frame.width - 40) * (349/316))
        case .highImage:
            return CGSize(width: (self.view.frame.width / 2) - 40 , height: (self.view.frame.width / 2)  * (254/155))
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
