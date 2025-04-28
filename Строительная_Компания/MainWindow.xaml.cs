using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Строительная_Компания.Entities;

namespace Строительная_Компания
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void ExitButton_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.Close();
        }

        private void MinButton_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void ToolBar_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                this.DragMove();
            }
        }

        private void LogoContainer_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                this.DragMove();
            }
        }

        private void OnPasswordChanged(object sender, RoutedEventArgs e)
        {
            
        }

        private void BtnEntrance_Click(object sender, RoutedEventArgs e)
        {
            var CurrentUser = AppData.db.Users.FirstOrDefault(u => u.Login == TxbLogin.Text && u.Password == PBPassword.Password);

            if (CurrentUser != null)
            {
                Menu menuWindow = new Menu(); // создаем экземпляр окна Menu
                menuWindow.Show(); // открываем новое окно Menu
                this.Close(); // закрываем текущее окно
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            
        }

        private void tb1_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            Registration registrationWindow = new Registration(); // создаем экземпляр окна Menu
            registrationWindow.Show(); // открываем новое окно Menu
            this.Close(); // закрываем текущее окно
        }
    }
}
