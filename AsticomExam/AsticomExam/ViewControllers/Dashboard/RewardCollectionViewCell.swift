//
//  RewardCollectionViewCell.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

import UIKit

class RewardCollectionViewCell: UICollectionViewCell {
    
    private var viewModel: RewardCollectionViewModel?
    
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
    
    func configure(reward: Reward, viewModel: RewardCollectionViewModel = RewardCollectionViewModel()) {
        self.viewModel = viewModel
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
        if rewardTitle.superview == nil {
            contentView.addSubview(rewardTitle)
            contentView.addSubview(rewardImage)
            
            NSLayoutConstraint.activate([
                rewardImage.topAnchor.constraint(equalTo: contentView.topAnchor),
                rewardImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                rewardImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                rewardImage.heightAnchor.constraint(equalToConstant: 120),
                rewardImage.widthAnchor.constraint(equalToConstant: 320),
                
                rewardTitle.topAnchor.constraint(equalTo: rewardImage.bottomAnchor, constant: 20),
                rewardTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                rewardTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                rewardTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            ])
        }
        
        rewardTitle.text = reward.name
        if let url = URL(string: reward.image) {
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


class RewardCollectionViewModel {
    let rewardServiceProviding: RewardServiceProviding
    var fetchImageComplete: ((_ data: Data) -> Void)?
    var fetchImageFailed: (() -> Void)?
 
    init(rewardServiceProviding: RewardServiceProviding = RewardService()) {
        self.rewardServiceProviding = rewardServiceProviding
    }
    
    func loadImage(imageURL: URL) {
        rewardServiceProviding.getImage(imageUrl: imageURL, completion: { [weak self] response in
            switch response {
            case .success(let data):
                self?.fetchImageComplete?(data)
            case .failure(_):
                self?.fetchImageFailed?()
            }
        })
    }
}
