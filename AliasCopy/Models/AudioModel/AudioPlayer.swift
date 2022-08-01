//
//  AudioPlayer.swift
//  AliasCopy
//
//  Created by Ilya Vasilev on 01.08.2022.
//

import Foundation
import AVFoundation
extension GameViewController {
    

func playTrueSound() {
    guard let path = Bundle.main.path(forResource: "trueSound", ofType:"mp3") else {
        return }
    let url = URL(fileURLWithPath: path)

    do {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}
    func playFalseSound() {
        guard let path = Bundle.main.path(forResource: "falseSound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    func playVictorySound() {
        guard let path = Bundle.main.path(forResource: "victorySound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
