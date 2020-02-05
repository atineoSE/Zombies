//
//  ViewController.swift
//  Zombies
//
//  Created by Adrian Tineo on 04.02.20.
//  Copyright © 2020 Adrian Tineo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: State
    var game: Game!
    var remainingLives = 3
    var totalWins = 0
    var totalLosses = 0
    
    // MARK: Outlets
    @IBOutlet var gridSquare: [UILabel]!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var heartsStackView: UIStackView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var finalMesageLabel: UILabel!
    @IBOutlet weak var totalLossesLabel: UILabel!
    @IBOutlet weak var totalWinsLabel: UILabel!
    
    // MARK: Actions
    // FIXME: this action is never called, why?
    @IBAction func didTapOverlayView(_ sender: UITapGestureRecognizer) {
        if remainingLives == 0 || game.hasWon {
            newGame()
        } else {
            newRound()
        }
    }
    
    @IBAction func moveUp(_ sender: UIButton) {
        game.movePlayer(.up)
        updateUI()
        updateGameState()
    }
    
    @IBAction func moveLeft(_ sender: UIButton) {
        game.movePlayer(.left)
        updateUI()
        updateGameState()
    }
    
    @IBAction func moveRight(_ sender: UIButton) {
        game.movePlayer(.right)
        updateUI()
        updateGameState()
    }
    
    @IBAction func moveDown(_ sender: UIButton) {
        game.movePlayer(.down)
        updateUI()
        updateGameState()
    }
    
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
    }

    // MARK: state management
    func updateGameState() {
        if game.hasLost {
            remainingLives -= 1
            displayFinalMessage(winning: false, hasRemainingLives: remainingLives > 0)
            if remainingLives == 0 {
                totalLosses += 1
            }
        }
        
        if game.hasWon {
            displayFinalMessage(winning: true, hasRemainingLives: true)
            totalWins += 1
        }
    }
    
    func newGame() {
        game = Game()
        remainingLives = 3
        updateHearts()
        updateUI()
        hideFinalMessage()
        // TODO: update number of wins and losses in the UI
    }
    
    func newRound() {
        game = Game()
        updateHearts()
        updateUI()
        hideFinalMessage()
    }
    
    // MARK: update UI
    func updateUI() {
        // update grid
        for (x, row) in game.visibleGrid.enumerated() {
            for (y, content) in row.enumerated() {
                updateSquare(x, y, content)
            }
        }
        
        // update buttons
        // TODO: disable buttons that are not possible, e.g. down when there is no way to go down
        // can you find a way to gray out the disabled button as well?
    }

    func updateSquare(_ x: Int, _ y: Int, _ content: String) {
        // FIXME: this formula to translate (x, y) coordinates to tag id is buggy,
        // can you fix it? And what does that strange code with filter do?
        // Can you find it in the documentation? Or maybe you can guess what it does?
        let coordinatesAsTag = x + y
        let squareLabel = gridSquare.filter { $0.tag == coordinatesAsTag }.first
        squareLabel?.text = content
    }
    
    func updateHearts() {
        precondition(heartsStackView.subviews.count == 3)
        switch remainingLives {
        case 3:
            heartsStackView.subviews.forEach { $0.isHidden = false }
        case 2:
            heartsStackView.subviews[0].isHidden = true
        case 1:
            heartsStackView.subviews[1].isHidden = true
        case 0:
            heartsStackView.subviews[2].isHidden = true
        default: break
        }
    }
    
    func hideFinalMessage() {
        overlayView.isHidden = true
        finalMesageLabel.isHidden = true
    }
    
    func displayFinalMessage(winning: Bool, hasRemainingLives: Bool) {
        overlayView.isHidden = false
        finalMesageLabel.isHidden = false
        
        if winning {
            finalMesageLabel.text =  "You won! 🥳"
        } else if hasRemainingLives {
            finalMesageLabel.text =  "Try again! 🤞"
        } else {
            finalMesageLabel.text =  "You lost! ☠️"
        }
    }

}

