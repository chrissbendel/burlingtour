import UIKit

class ToursViewController: UITableViewController {
    
    // Default tours
    let tours = [
        Tour(name: "Ghost Tour", desc: "Spooooky Ghost Tour", emoji:"👻", url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"),
        Tour(name: "Lake Champlain", desc: "History of Lake Champlain", emoji: "🌊", url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    // Table view things!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tours.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TourCell", for: indexPath) as! TourCell
        let tour = tours[indexPath.row]
        cell.desc.text = tour.desc
        cell.name.text = tour.name
        cell.emoji.text = tour.emoji
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tourDetail = segue.destination as! TourDetail
        let indexPath = tableView.indexPathForSelectedRow!
        tourDetail.tour = tours[indexPath.row]
    }
    
}
