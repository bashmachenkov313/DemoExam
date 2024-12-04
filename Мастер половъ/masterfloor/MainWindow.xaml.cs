using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting;
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

namespace masterfloor
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        List<model.Partner> partners;
        public MainWindow()
        {
            InitializeComponent();
            ////Подключение к БД с проверкой
            try 
            {
                //Создание объекта DB
                App.DB = new model.MasterFloorEntities();
                partners = App.DB.Partner.ToList();
                MessageBox.Show("Подключение успешно созданно", "Проверка подключения", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch 
            {
                MessageBox.Show("Подключение несозданно", "Проверка подключения", MessageBoxButton.OK, MessageBoxImage.Error);
                return;

            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //завершение программы
            Close();
        }

        private void Window_Activated(object sender, EventArgs e)
        {
        }
    }
}
