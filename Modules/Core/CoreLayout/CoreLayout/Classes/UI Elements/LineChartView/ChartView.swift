//
//  ChartView.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 13/2/22.
//

import UIKit
import Charts

public final class ChartView: UIView {
    private let chartView = Init(LineChartView()) {
        $0.chartDescription?.enabled = false
        $0.dragEnabled = true
        $0.setScaleEnabled(true)
        $0.pinchZoomEnabled = true
        $0.rightAxis.enabled = false

        $0.legend.form = .line
        $0.legend.font = .boldSystemFont(ofSize: 14)
        $0.legend.textColor = .primary
        $0.legend.horizontalAlignment = .left
        $0.legend.verticalAlignment = .bottom
        $0.legend.orientation = .horizontal
        $0.legend.drawInside = false

        let xAxis = $0.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 12)
        xAxis.labelCount = Constants.xLabelCount

        let leftAxis = $0.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 12)
        leftAxis.labelCount = Constants.yLabelCount
        leftAxis.labelPosition = .outsideChart
        leftAxis.gridColor = .primary
        leftAxis.drawGridLinesEnabled = true
        leftAxis.granularityEnabled = true
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
public extension ChartView {
    func display(model: LineChartModel) {
        chartView.legend.enabled = model.legendEntries.hasElements
        chartView.legend.setCustom(entries: model.legendEntries)
        chartView.xAxis.valueFormatter = model.formatter
        chartView.data = LineChartData(dataSets: model.dataSets)
        chartView.animate(yAxisDuration: Constants.animationDuration)
    }

}

// MARK: - Private methods
private extension ChartView {
    func setupView() {
        addSubviews()
        setupConstraints()
    }

    func addSubviews() {
        addSubview(chartView)
    }

    func setupConstraints() {
        chartView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

private extension ChartView {
    enum Constants {
        static let xLabelCount: Int = 7
        static let yLabelCount: Int = 15
        static let animationDuration: TimeInterval = 0.15
    }
}
