using Xamarin.Forms;
using Xamarin.Forms.Platform.GTK;


namespace XamlSamples.GTK
{
    class Program
    {
        static void Main(string[] args)
        {
            Gtk.Application.Init();
            Forms.Init();

            var app = new App();
            var window = new FormsWindow();
            window.LoadApplication(app);
            window.SetApplicationTitle("XamlSamples");
            window.Show();
            Gtk.Application.Run();
        }
    }
}