
import UIKit
import SegementSlide

class Page4ViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate {
    
    var parser = XMLParser()
    
    var currentElementName: String!
    
    var newsItems = [NewsItems]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        
        //XLMパース
        let urlString = "https://ideasforgood.jp/feed/"
        let url:URL = URL(string: urlString)!
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()

        
    }
    
    @objc var scrollView: UIScrollView{
    
    return tableView
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsItems.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height/5
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")

        cell.backgroundColor = .white
        
        
        let newsItem = self.newsItems[indexPath.row]
        cell.textLabel?.text = newsItem.title
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.5)
        cell.textLabel?.textColor = .black
        cell.textLabel?.numberOfLines = 3
        
        cell.detailTextLabel?.text = newsItem.url
        cell.detailTextLabel?.textColor = .black
        
        

        return cell
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        
        currentElementName = nil
        if elementName == "item" {
            self.newsItems.append(NewsItems())
            
            
        }else{
            
            currentElementName = elementName
            
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if self.newsItems.count > 0 {
            
            let lastItem = self.newsItems[self.newsItems.count - 1]
            
            switch self.currentElementName {
            case "title":
                lastItem.title = string
            case "link":
                lastItem.url = string
            case "pubDate":
                lastItem.pubDate = string
            default:break
            }
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        self.currentElementName = nil
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    //WEbViewにURL渡す
        let webViewController = WebViewController()
        webViewController.modalTransitionStyle = .crossDissolve
        //newsItemの何番目を渡すのか
        let newsItem = newsItems[indexPath.row]
        UserDefaults.standard.set(newsItem.url, forKey: "url")
        present(webViewController, animated: true, completion: nil)
        
    }


}
