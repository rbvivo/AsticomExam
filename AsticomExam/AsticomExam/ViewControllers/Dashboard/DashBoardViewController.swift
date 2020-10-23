//
//  DashBoardViewController.swift
//  AsticomExam
//
//  Created by Bryan Vivo on 10/23/20.
//

import UIKit

class DashBoardViewController: UIViewController {
    
    private let viewModel: DashboardViewModel

    private lazy var gridFlowLayout: UICollectionViewLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 8
        flowLayout.minimumInteritemSpacing = 4
        flowLayout.estimatedItemSize = CGSize(width: 320, height: 200)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        return flowLayout

    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: gridFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RewardCollectionViewCell.self, forCellWithReuseIdentifier: RewardCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    private lazy var userInfoView: UserInfoView = {
        let view = UserInfoView(userName: viewModel.userName, mobileNumber: viewModel.mobileNumber, referalCode: viewModel.referalCode)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(viewModel: DashboardViewModel) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(userInfoView)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            userInfoView.topAnchor.constraint(equalTo: view.topAnchor),
            userInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.reloadData()
    }
}

extension DashBoardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.rewardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RewardCollectionViewCell.reuseIdentifier, for: indexPath) as? RewardCollectionViewCell else { return .init() }
        cell.configure(reward: viewModel.rewardList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rewardDetailsController = RewardDetailsViewController(viewModel: RewardDetailsViewModel(reward: viewModel.rewardList[indexPath.row]))
        self.navigationController?.pushViewController(rewardDetailsController, animated: true)
    }
}
