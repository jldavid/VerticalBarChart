import Charts
import SwiftUI

struct ChartData: Identifiable, Equatable {
    let type: String
    let count: Int
    var id: String { return type }
}

struct ContentView: View {
    
    let data = [ChartData(type: "fish", count: 10),
                    ChartData(type: "reptils", count: 21),
                    ChartData(type: "bird", count: 18),
                    ChartData(type: "dog", count: 40),
                    ChartData(type: "cat", count: 65)]
    
    var body: some View {
        VStack {
            Chart(data) { dataPoint in
                BarMark(x: .value("Population", dataPoint.count),
                        y: .value("Type", dataPoint.type))
                .foregroundStyle(by: .value("Type", dataPoint.type))
                .annotation(position: .trailing) {
                    Text(String(dataPoint.count))
                        .foregroundColor(.gray)
                }
            }
            .chartLegend(.hidden)
            .chartXAxis(.hidden)
            .chartYAxis {
                AxisMarks { _ in
                    AxisValueLabel()
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
