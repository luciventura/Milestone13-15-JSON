//
//  ViewController.swift
//  Milestone JSON
//
//  Created by Luciene Ventura on 14/05/21.
//

import UIKit

struct Country: Codable, Comparable {
    static func < (lhs: Country, rhs: Country) -> Bool {
        if lhs.country != rhs.country {
            return lhs.country < rhs.country
        }
        return true
    }
    

    var country: String
    var info: String
    
}

struct Countries: Codable {
    var countries = [Country]()
}


class ViewController: UITableViewController {
    var countriesArray = [Country]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlString = Bundle.main.url(forResource: "countries", withExtension: "json") {
            if let data = try? Data(contentsOf: urlString) {
                parse(json: data)
                
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonCountries = try? decoder.decode(Countries.self, from: json) {
            countriesArray = jsonCountries.countries
            countriesArray.sort()
            
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let countryName = countriesArray[indexPath.row]
        
        cell.textLabel?.text = countryName.country
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedInfo = countriesArray[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

