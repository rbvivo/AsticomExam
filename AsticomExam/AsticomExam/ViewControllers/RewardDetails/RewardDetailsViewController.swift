//
//  RewardDetailsViewController.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

import UIKit

class RewardDetailsViewController: UIViewController {

    private let viewModel: RewardDetailsViewModel
    
    private lazy var rewardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var rewardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private lazy var rewardDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    
    init(viewModel: RewardDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        view.addSubview(rewardTitle)
        view.addSubview(rewardImage)
        view.addSubview(rewardDescription)
        
        
        NSLayoutConstraint.activate([
            rewardImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardImage.heightAnchor.constraint(equalTo: rewardImage.widthAnchor, multiplier: 9.0/16.0),
            
            rewardTitle.topAnchor.constraint(equalTo: rewardImage.bottomAnchor, constant: 20),
            rewardTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rewardTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           
            rewardDescription.topAnchor.constraint(equalTo: rewardTitle.bottomAnchor, constant: 20),
            rewardDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rewardDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
     
        rewardTitle.text = viewModel.reward.name
        rewardDescription.text = viewModel.reward.description
        if let url = URL(string: viewModel.reward.image) {
            viewModel.loadImage(imageURL: url)
        }
       
        viewModel.fetchImageComplete = { [weak self] data in
            self?.rewardImage.image = UIImage(data: data)
        }
        
        viewModel.fetchImageFailed = { [weak self] in
            self?.rewardImage.image = nil
        }
    }
}
