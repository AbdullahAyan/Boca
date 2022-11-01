//
//  DetailTableViewCell.swift
//  Boca
//
//  Created by Abdullah Ayan on 1.11.2022.
//

import UIKit
import SnapKit

class DetailTableViewCell: UITableViewCell {
    
    lazy var foodImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    lazy var detailLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(foodImageView)
        foodImageView.snp.makeConstraints { make in
            make.top.left.equalTo(safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            make.width.equalTo(80)
            make.width.equalTo(foodImageView.snp.height)
        }
        
        addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.centerY.equalTo(foodImageView)
            make.left.equalTo(foodImageView.snp.right).offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
