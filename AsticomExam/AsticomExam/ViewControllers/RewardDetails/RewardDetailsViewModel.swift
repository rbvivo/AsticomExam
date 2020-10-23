//
//  RewardDetailsViewModel.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

import  Foundation

class RewardDetailsViewModel {
    var reward: Reward
    let rewardServiceProviding: RewardServiceProviding
    var fetchImageComplete: ((_ data: Data) -> Void)?
    var fetchImageFailed: (() -> Void)?
    
    init(reward: Reward, rewardServiceProviding: RewardServiceProviding = RewardService()) {
        self.reward = reward
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
