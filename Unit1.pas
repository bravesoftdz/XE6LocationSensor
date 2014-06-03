unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Sensors,
  System.Sensors.Components, FMX.WebBrowser, FMX.StdCtrls, FMX.ListBox,
  FMX.Layouts;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBoxHeader1: TListBoxHeader;
    Label1: TLabel;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    Switch1: TSwitch;
    Label2: TLabel;
    Label3: TLabel;
    WebBrowser1: TWebBrowser;
    LocationSensor1: TLocationSensor;
    procedure Switch1Switch(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
const
  sGoogleMapURL : String =  'https://maps.google.com/maps?q=%s,%s';
begin
  label2.Text := NewLocation.Latitude.ToString;
  label3.Text := NewLocation.Longitude.ToString;
  WebBrowser1.Navigate(Format(sGoogleMapURL,
                              [NewLocation.Latitude.ToString,
                               NewLocation.Longitude.ToString]));
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  LocationSensor1.Active := Switch1.IsChecked;
end;

end.
