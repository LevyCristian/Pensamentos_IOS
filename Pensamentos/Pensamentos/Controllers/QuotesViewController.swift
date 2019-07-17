//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Anderson Alencar on 03/07/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBackground: UIImageView!
    @IBOutlet weak var lbQuote: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var ctTop: NSLayoutConstraint!
    
    let config  = Configuration.shared //
    let quoteManager: QuotesManager = QuotesManager()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareQuote()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (Notification) in
            
            self.formatView() // nommomento que carregar a view ela vai começar a observar essa notificação, que quando disparada vai executar o refresh da view
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        formatView()
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    
    func formatView()  {
        self.view.backgroundColor = self.config.colorScheme == 0 ? .white: UIColor(red: 0.693, green: 0.266, blue: 0.058, alpha: 1.0)
        self.lbQuote.textColor = self.config.colorScheme == 0 ? .black : .white
        self.lbAuthor.textColor = self.config.colorScheme == 0 ? UIColor(red: 0.752, green: 0.376, blue: 0.192, alpha: 1.0) : .yellow
    }

    func prepareQuote() {
        timer?.invalidate() // antes de agendar algo eu invalido o angedamento anterior
        if self.config.autoRefresh{
            timer  = Timer.scheduledTimer(withTimeInterval: self.config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            } // esse método constrói(implementa um timer) e devolve ele
        }
        showRandomQuote()
    }
    
    func showRandomQuote() {
        let quote = quoteManager.getRandomQuote()
        self.lbQuote.text = quote.quoteFormatted
        self.lbAuthor.text = quote.authorFormatted
        self.ivPhoto.image = UIImage(named: quote.image)
        self.ivPhotoBackground.image = self.ivPhoto.image
        
        
        self.lbQuote.alpha = 0.0
        self.lbAuthor.alpha = 0.0
        self.ivPhoto.alpha = 0.0
        self.ivPhotoBackground.alpha = 0.0
        self.ctTop.constant = 50
        self.view.layoutIfNeeded() // quando se tenta animar uma constraint é nescessário utilizar esse método para dizer a view que redefina a posicao dos elementos presentes nela
        
        UIView.animate(withDuration: 3.0) { // aqui nesa closure eu defino o estado final das minhas instancias
            self.lbQuote.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.ivPhoto.alpha = 1.0
            self.ivPhotoBackground.alpha = 0.25
            self.ctTop.constant = 10
            self.view.layoutIfNeeded()
        }
    }
}
