//
//  CollectionViewController.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 27.06.2022.
//

import UIKit
import Alamofire

// MARK: - CollectionViewProtocol
protocol CollectionViewProtocol: AnyObject {
    func reloadData()
}

// MARK: - CollectionViewController
class CollectionViewController: UICollectionViewController {
    
    var presenter: WeatherPresenterProtocol?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = Section.allCases[section]
        switch section {
        case .hourly:
            return presenter?.model?.hourly.count ?? 0
        case .daily:
            return presenter?.model?.daily.count ?? 0
        default:
           return section.numberOfRows
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = Section.allCases[indexPath.section]
        switch sectionType {
        case .mainHeader:
            let header = collectionView.dequeueHeader(MainHeaderCollectionReusableView.self, indexPath: indexPath)
            header.configuration(model: presenter?.model)
            return header
        case .hourly:
            let header = collectionView.dequeueHeader(SectionHeaderView.self, indexPath: indexPath)
            header.configuration(select: .hourlyHeader)
            return header
        case .daily:
            let header = collectionView.dequeueHeader(SectionHeaderView.self, indexPath: indexPath)
            header.configuration(select: .dailyHeader)
            return header
        case .detailsFirsr:
            let header = collectionView.dequeueHeader(DetailsCollectionReusableView.self, indexPath: indexPath)
            header.configuration(select: .uvIndexAndSunset)
            return header
        case .detailsSecond:
            let header = collectionView.dequeueHeader(DetailsCollectionReusableView.self, indexPath: indexPath)
            header.configuration(select: .fielsLikeAndHumidity)
            return header
        case .detailsThird:
            let header = collectionView.dequeueHeader(DetailsCollectionReusableView.self, indexPath: indexPath)
            header.configuration(select: .visibilityAndWind)
            return header
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = Section.allCases[indexPath.section]
        switch sectionType {
        case .mainHeader:
            let cell = collectionView.dequeueCell(MainCollectionViewCell.self, indexPath: indexPath)
            return cell
        case .hourly:
            let cell = collectionView.dequeueCell(WeatherHourlyCollectionViewCell.self, indexPath: indexPath)
            cell.configureHourly(model: presenter?.model, indexPath: indexPath)
            return cell
        case .daily :
            let cell = collectionView.dequeueCell(WeatherDailyCollectionViewCell.self, indexPath: indexPath)
            cell.configureDaily(model: presenter?.model, indexPath: indexPath)
            return cell
        case .detailsFirsr:
            let cell = collectionView.dequeueCell(DetailsCollectionViewCell.self, indexPath: indexPath)
            cell.configuration(select: .uvIndexAndSunset, model: presenter?.model, indexPach: indexPath)
            return cell
        case .detailsSecond:
            let cell = collectionView.dequeueCell(DetailsCollectionViewCell.self, indexPath: indexPath)
            cell.configuration(select: .fielsLikeAndHumidity, model: presenter?.model, indexPach: indexPath)
            return cell
        case .detailsThird:
            let cell = collectionView.dequeueCell(DetailsCollectionViewCell.self, indexPath: indexPath)
            cell.configuration(select: .visibilityAndWind, model: presenter?.model, indexPach: indexPath)
            return cell
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [self] (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            switch sectionKind {
            case .mainHeader:
                let itemSize =
                NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(1))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [self.supplementaryMainHeaderItem()]
                return section
            case .hourly:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(65),
                    heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 5,
                    bottom: 0,
                    trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(120))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
                
                let sectionBackground = NSCollectionLayoutDecorationItem.background(
                    elementKind: "background-element-kind")
                
                sectionBackground.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 0,
                    bottom: 5,
                    trailing: 0)
                section.decorationItems = [sectionBackground]
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                
                return section
            case .daily :
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(60))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 5,
                    bottom: 5,
                    trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(0.75))
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                
                let section = NSCollectionLayoutSection(group: group)
                let sectionBackground = NSCollectionLayoutDecorationItem.background(
                    elementKind: "background-element-kind")
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 10,
                    leading: 0,
                    bottom: 10,
                    trailing: 0)
                
                sectionBackground.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 0,
                    bottom: 5,
                    trailing: 0)
                section.decorationItems = [sectionBackground]
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                return section
            case .detailsFirsr:
                return sectionsDetails()
            case .detailsSecond:
                return sectionsDetails()
            case .detailsThird:
                return sectionsDetails()
            }
        }
        
        layout.register(BackgroundSupplementaryView.self, forDecorationViewOfKind: "background-element-kind")
        return layout
    }
    
    func sectionsDetails() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 5,
            bottom: 10,
            trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(130))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0)
        section.boundarySupplementaryItems = [self.supplementaryDetailsHeader()]
        return section
    }
    
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .absolute(51))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        header.pinToVisibleBounds = true
        return header
    }
    
    func supplementaryMainHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .absolute(200))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        return header
    }
    
    func supplementaryDetailsHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .absolute(25))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        header.pinToVisibleBounds = true
        return header
    }
    
    func configureCollectionView() {
        collectionView.registerCell(WeatherHourlyCollectionViewCell.self)
        collectionView.registerCell(WeatherDailyCollectionViewCell.self)
        collectionView.registerCell(MainCollectionViewCell.self)
        collectionView.registerCell(DetailsCollectionViewCell.self)
        collectionView.registerHeader(SectionHeaderView.self)
        collectionView.registerHeader(MainHeaderCollectionReusableView.self)
        collectionView.registerHeader(DetailsCollectionReusableView.self)
        collectionView.collectionViewLayout = createLayout()
        collectionView.backgroundColor = .clear
    }
}

// MARK: - CollectionViewController
extension CollectionViewController: CollectionViewProtocol {
    func reloadData() {
        collectionView.reloadData()
    }
}
