from src.main_window import Ui_MainWindow
from src.repository import load_data_with_skidka, calculate_skidka
from PyQt6 import QtCore, QtGui, QtWidgets

if __name__ == '__main__':
    partners = load_data_with_skidka()

    import sys
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    ui.show_data(partners)

    MainWindow.show()
    sys.exit(app.exec())
