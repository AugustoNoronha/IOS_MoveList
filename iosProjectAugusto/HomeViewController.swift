//
//  HomeViewController.swift
//  iosProjectAugusto
//
//  Created by COTEMIG on 03/12/21.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    public var listfilmes: Filmes?
    public var topFilmes: [Filmes] = []
    public var indexFilme = 0

  
    @IBOutlet weak var tableView: autoSizeTableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topFilmes.count
    }
    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UICell
        
        cell.nameMoveText.text = topFilmes[indexPath.row].title
        cell.timeLastText.text = String(topFilmes[indexPath.row].voteAverage) + "/10"
        

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexFilme = indexPath.row
        print(indexPath.row)
        performSegue(withIdentifier: "more", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "more"{
            let about = segue.destination as? AboutViewController
            about?.overview = topFilmes[indexFilme].overview
            about?.moveTitle = topFilmes[indexFilme].title
            about?.releaseDate = String(topFilmes[indexFilme].releaseDate)
            about?.rateP = String(topFilmes[indexFilme].voteAverage) + "%"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=3dbf9fa4230b09569f99c4e29cea0247&language=en-US&page=1")!

        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else { return }
            print(data)

            do {
                let coisa = try JSONDecoder().decode(FilmesResponse.self, from: data)
                let filmes = coisa.results
                    self?.topFilmes.append(contentsOf: filmes)
                
            } catch {
                print(error.localizedDescription)
            }
            
         
        }
        task.resume()
    }
}
