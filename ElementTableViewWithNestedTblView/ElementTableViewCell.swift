//
//  ElementTableViewCell.swift
//  ElementTableViewWithNestedTblView
//
//  Created by Ani Adhikary on 02/06/18.
//  Copyright © 2018 Ani Adhikary. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var elementLabel: UILabel!    
    @IBOutlet weak var elementSymbolLabel: UILabel!
    @IBOutlet weak var nestedElementTableView: UITableView!
    @IBOutlet weak var nestedElementTableViewHeightConstraint: NSLayoutConstraint!
    
    var nestedElements = [Element]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nestedElements = [
            Element(elementName: "Hydrogen", elementSymbol: "H"),
            Element(elementName: "Helium", elementSymbol: "He"),
            Element(elementName: "Lithium", elementSymbol: "Li"),
            Element(elementName: "Beryllium", elementSymbol: "Be"),
            Element(elementName: "Boron", elementSymbol: "B"),
            Element(elementName: "Carbon", elementSymbol: "C"),
            Element(elementName: "Nitrogen", elementSymbol: "N"),
            Element(elementName: "Oxygen", elementSymbol: "O"),
            Element(elementName: "Fluorine", elementSymbol: "F"),
            Element(elementName: "Neon", elementSymbol: "Ne"),
            Element(elementName: "Sodium", elementSymbol: "Na"),
            Element(elementName: "Magnesium", elementSymbol: "Mg"),
            Element(elementName: "Aluminum", elementSymbol: "Al"),
            Element(elementName: "Silicon", elementSymbol: "Si"),
            Element(elementName: "Phosphorus", elementSymbol: "P"),
            Element(elementName: "Sulfur", elementSymbol: "S"),
            Element(elementName: "Chlorine", elementSymbol: "Cl"),
            Element(elementName: "Argon", elementSymbol: "Ar"),
            Element(elementName: "Potassium", elementSymbol: "K"),
            Element(elementName: "Calcium", elementSymbol: "Ca"),
            Element(elementName: "Scandium", elementSymbol: "Sc")
        ]
        
        self.nestedElementTableView.register(UINib(nibName: "NestedElementTableViewCell", bundle: nil), forCellReuseIdentifier: "NestedElementCell")
        nestedElementTableView.dataSource = self
        nestedElementTableView.delegate = self
        //nestedElementTableViewHeightConstraint.constant = 44 * CGFloat(nestedElements.count)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension ElementTableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nestedElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nestedElementTableView.dequeueReusableCell(withIdentifier: "NestedElementCell", for: indexPath) as! NestedElementTableViewCell
        let nestedElement = nestedElements[indexPath.row]
        
        cell.nestedElementLabel.text = nestedElement.elementName
        cell.nestedElementSymbolLabel.text = nestedElement.elementSymbol
        
        return cell
        
    }
}
