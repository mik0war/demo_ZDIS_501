# Form implementation generated from reading ui file 'ui/edit_window.ui'
#
# Created by: PyQt6 UI code generator 6.9.0
#
# WARNING: Any manual changes made to this file will be lost when pyuic6 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt6 import QtCore, QtGui, QtWidgets
from PyQt6.QtWidgets import QWidget

from src import repository
from src.data_types import Partner
from src.repository import load_data_with_skidka


class UiEditWindow(object):
    def setupUi(self, Form: QWidget, ui_mainWindow, partner=None):
        self.Form = Form
        self.ui_mainWindow = ui_mainWindow
        self.Form.setObjectName("Form")
        self.Form.resize(400, 486)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap("ui\\../Мастер пол.png"), QtGui.QIcon.Mode.Normal, QtGui.QIcon.State.Off)
        Form.setWindowIcon(icon)
        self.verticalLayoutWidget = QtWidgets.QWidget(parent=self.Form)
        self.verticalLayoutWidget.setGeometry(QtCore.QRect(0, 0, 401, 497))
        self.verticalLayoutWidget.setObjectName("verticalLayoutWidget")
        self.verticalLayout = QtWidgets.QVBoxLayout(self.verticalLayoutWidget)
        self.verticalLayout.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout.setObjectName("verticalLayout")
        self.label_3 = QtWidgets.QLabel(parent=self.verticalLayoutWidget)
        self.label_3.setObjectName("label_3")
        self.verticalLayout.addWidget(self.label_3)
        self.name = QtWidgets.QLineEdit(parent=self.verticalLayoutWidget)
        self.name.setObjectName("name")
        self.verticalLayout.addWidget(self.name)
        self.label_4 = QtWidgets.QLabel(parent=self.verticalLayoutWidget)
        self.label_4.setObjectName("label_4")
        self.verticalLayout.addWidget(self.label_4)
        self.type = QtWidgets.QComboBox(parent=self.verticalLayoutWidget)
        self.type.setObjectName("type")
        self.verticalLayout.addWidget(self.type)
        self.label_2 = QtWidgets.QLabel(parent=self.verticalLayoutWidget)
        self.label_2.setObjectName("label_2")
        self.verticalLayout.addWidget(self.label_2)
        self.d_fname = QtWidgets.QLineEdit(parent=self.verticalLayoutWidget)
        self.d_fname.setObjectName("d_fname")
        self.verticalLayout.addWidget(self.d_fname)
        self.label = QtWidgets.QLabel(parent=self.verticalLayoutWidget)
        self.label.setObjectName("label")
        self.verticalLayout.addWidget(self.label)
        self.d_lname = QtWidgets.QLineEdit(parent=self.verticalLayoutWidget)
        self.d_lname.setObjectName("d_lname")
        self.verticalLayout.addWidget(self.d_lname)
        self.label_5 = QtWidgets.QLabel(parent=self.verticalLayoutWidget)
        self.label_5.setObjectName("label_5")
        self.verticalLayout.addWidget(self.label_5)
        self.d_sname = QtWidgets.QLineEdit(parent=self.verticalLayoutWidget)
        self.d_sname.setObjectName("d_sname")
        self.verticalLayout.addWidget(self.d_sname)
        self.label_6 = QtWidgets.QLabel(parent=self.verticalLayoutWidget)
        self.label_6.setObjectName("label_6")
        self.verticalLayout.addWidget(self.label_6)
        self.address = QtWidgets.QLineEdit(parent=self.verticalLayoutWidget)
        self.address.setObjectName("address")
        self.verticalLayout.addWidget(self.address)
        self.label_7 = QtWidgets.QLabel(parent=self.verticalLayoutWidget)
        self.label_7.setObjectName("label_7")
        self.verticalLayout.addWidget(self.label_7)
        self.email = QtWidgets.QLineEdit(parent=self.verticalLayoutWidget)
        self.email.setObjectName("email")
        self.verticalLayout.addWidget(self.email)
        self.label_8 = QtWidgets.QLabel(parent=self.verticalLayoutWidget)
        self.label_8.setObjectName("label_8")
        self.verticalLayout.addWidget(self.label_8)
        self.inn = QtWidgets.QLineEdit(parent=self.verticalLayoutWidget)
        self.inn.setObjectName("inn")
        self.verticalLayout.addWidget(self.inn)
        self.label_9 = QtWidgets.QLabel(parent=self.verticalLayoutWidget)
        self.label_9.setObjectName("label_9")
        self.verticalLayout.addWidget(self.label_9)
        self.rating = QtWidgets.QLineEdit(parent=self.verticalLayoutWidget)
        self.rating.setObjectName("rating")
        self.verticalLayout.addWidget(self.rating)
        self.pushButton = QtWidgets.QPushButton(parent=self.verticalLayoutWidget)
        self.pushButton.setObjectName("pushButton")
        self.pushButton.clicked.connect(self.ok)
        self.verticalLayout.addWidget(self.pushButton)
        self.pushButton_2 = QtWidgets.QPushButton(parent=self.verticalLayoutWidget)
        self.pushButton_2.setObjectName("pushButton_2")
        self.pushButton_2.clicked.connect(self.Form.close)
        self.verticalLayout.addWidget(self.pushButton_2)

        self.retranslateUi(self.Form, partner)
        QtCore.QMetaObject.connectSlotsByName(self.Form)

    def retranslateUi(self, Form, partner: Partner):
        _translate = QtCore.QCoreApplication.translate
        title = 'Создание'
        self.is_edit = False

        if partner and partner.id:
            title = 'Редактирование'
            self.is_edit = True
            self.partner = partner
        if partner:
            self.fill_partner(partner)

        self.Form.setWindowTitle(_translate("Form", title))
        self.label_3.setText(_translate("Form", "Наименование"))
        self.label_4.setText(_translate("Form", "Тип"))
        self.label_2.setText(_translate("Form", "Имя директора"))
        self.label.setText(_translate("Form", "Фамилия директора"))
        self.label_5.setText(_translate("Form", "Отчество директора"))
        self.label_6.setText(_translate("Form", "Адрес"))
        self.label_7.setText(_translate("Form", "Электронная почта"))
        self.label_8.setText(_translate("Form", "ИНН"))
        self.label_9.setText(_translate("Form", "Рейтинг"))
        self.pushButton.setText(_translate("Form", "ОК"))
        self.pushButton_2.setText(_translate("Form", "Назад"))

        types = [i[0] for i in repository.get_types()]

        self.type.addItems(types)

    def fill_partner(self, partner: Partner):
        self.type.setCurrentText(partner.type)
        self.rating.setText(f'{partner.rating}')
        self.name.setText(partner.name)
        self.address.setText(partner.address)
        self.email.setText(partner.e_mail)
        self.d_fname.setText(partner.d_first_name)
        self.d_lname.setText(partner.d_last_name)
        self.d_sname.setText(partner.d_sur_name)
        self.inn.setText(f'{partner.inn}')

    def ok(self):
        partner = Partner(
            self.type.currentText(),
            self.name.text(),
            self.d_fname.text(),
            self.d_lname.text(),
            self.d_sname.text(),
            self.email.text(),
            '',
            self.address.text(),
            self.inn.text(),
            self.rating.text(),
        )

        if self.is_edit:
            repository.update(self.partner.id, partner)
        else:
            repository.create(partner)

        self.ui_mainWindow.clear_list()
        self.ui_mainWindow.show_data(load_data_with_skidka())

        self.Form.close()

if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    Form.show()
    sys.exit(app.exec())
