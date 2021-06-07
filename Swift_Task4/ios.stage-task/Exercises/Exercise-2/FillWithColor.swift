import Foundation

final class FillWithColor {
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {

        if (row < 0 || column < 0 || row >= image.count || column >= image[0].count || image.count < 0 || newColor > 65536 || image[0].count > 50) {
            return image
        }
        
//        let m = image.count
//        let n = image[0].count
        let color = image[row][column]
        var matrix = image
        matrica(&matrix, row, column, newColor,color)
        return matrix
    }
    
    func matrica(_ matrix: inout [[Int]], _ row: Int, _ column: Int, _ newColor: Int, _ color: Int) {
        if (row >= 0 && column >= 0 && row < matrix.count && column < matrix[0].count && matrix[row][column] != newColor && matrix[row][column] == color) {
            
            if (column < matrix[row].count) {
            matrix[row][column] = newColor
            // top
            matrica(&matrix, row - 1, column, newColor, color)
            // bottom
            matrica(&matrix, row + 1, column, newColor, color)
            // left
            matrica(&matrix, row, column - 1, newColor, color)
            // right
            matrica(&matrix, row, column + 1, newColor, color)

            }
        }
    }
}
