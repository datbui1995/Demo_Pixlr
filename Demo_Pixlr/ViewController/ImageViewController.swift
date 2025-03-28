//
//  ImageViewController.swift
//  Demo_Pixlr
//
//  Created by Dat Bui on 22/3/25.
//

import UIKit

class ImageViewController: UIViewController {
    
    
    @IBOutlet weak var viewCanvas: CanvasView!
    
    private var viewModel: ImageViewModel
    
    init(viewModel: ImageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: Self.identifier, bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        viewModel.makeListSquare(numberOfSquareEdgeItems: 2)
        viewCanvas.drawSquare(listSquare: viewModel.listSquare)
    }
    
    @IBAction func clickFourSquare(_ sender: Any) {
        viewCanvas.removeAll()
        viewModel.makeListSquare(numberOfSquareEdgeItems: 2)
        viewCanvas.drawSquare(listSquare: viewModel.listSquare)
    }
    
    @IBAction func clickNineSquare(_ sender: Any) {
        viewCanvas.removeAll()
        viewModel.makeListSquare(numberOfSquareEdgeItems: 3)
        viewCanvas.drawSquare(listSquare: viewModel.listSquare)
    }
    
    @IBAction func addImage(_ sender: Any) {
        viewCanvas.addImageView(at: viewModel.getSelectedRect(at: 0), with: viewModel.getImage())
    }
    
    @IBAction func filterVibrance(_ sender: Any) {
        viewModel.filterVibrance(from: viewModel.getImage(), vibrance: 1, isOpaque: true) { [weak self] image in
            guard let self = self, let image = image else { return }
            self.viewCanvas.addImageView(at: viewModel.getSelectedRect(at: 1), with: image)
        }
    }
    
    @IBAction func filterCLAHE(_ sender: Any) {
        viewModel.applyCLAHE(image: viewModel.getImage(), isOpaque: true) { [weak self] image in
            guard let self = self, let image = image else { return }
            self.viewCanvas.addImageView(at: viewModel.getSelectedRect(at: 2), with: image)
        }
    }
    
}
