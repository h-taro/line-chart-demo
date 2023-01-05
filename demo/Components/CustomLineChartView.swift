//
//  CustomLineChartView.swift
//  demo
//
//  Created by 平石　太郎 on 2023/01/04.
//

import Charts
import UIKit

class CustomLineChartView: UIView {
    @IBOutlet weak var lineChart: LineChartView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        if let view = UINib(
            nibName: .init(describing: Self.self),
            bundle: nil
        ).instantiate(withOwner: self).first as? UIView {
            view.frame = bounds
            addSubview(view)
        }
        
        setup()
    }
    
    func updateChartEntries(_ entries: [ChartDataEntry]) {
        let dataSet = LineChartDataSet(entries: entries)
        
        let colors: [CGColor] = [
            UIColor.accentColor.cgColor,
            UIColor.text.cgColor,
        ]
        let gradient = CGGradient(
            colorsSpace: nil,
            colors: colors as CFArray,
            locations: nil
        )!

        dataSet.circleRadius = 4
        dataSet.fill = LinearGradientFill(gradient: gradient)
        dataSet.setCircleColor(.text)
        dataSet.colors = [.text]
        dataSet.drawFilledEnabled = true
        dataSet.drawValuesEnabled = false
        
        let data = LineChartData(dataSet: dataSet)
        lineChart.data = data
    }
}

// MARK: - SETUP
extension CustomLineChartView {
    private func setup() {
        let xAxis = lineChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = .text
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = false
        
        let leftAxis = lineChart.leftAxis
        leftAxis.axisMinimum = .zero
        leftAxis.zeroLineColor = .text
        leftAxis.labelCount = 5
        leftAxis.labelTextColor = .text
        leftAxis.drawGridLinesEnabled = false
        leftAxis.drawZeroLineEnabled = true
        
        lineChart.rightAxis.enabled = false
        
        lineChart.legend.enabled = false
        
        lineChart.noDataText = ""
        lineChart.highlightPerTapEnabled = false
        lineChart.dragEnabled = false
        lineChart.pinchZoomEnabled = false
        lineChart.setScaleEnabled(false)
    }
}
