VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form F2 
   BorderStyle     =   5  '�nderbares Werkzeugfenster
   Caption         =   "3D"
   ClientHeight    =   6300
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   600
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6300
   ScaleWidth      =   600
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows-Standard
   Begin ComctlLib.Toolbar TB2 
      Align           =   1  'Oben ausrichten
      Height          =   660
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   600
      _ExtentX        =   1058
      _ExtentY        =   1164
      ButtonWidth     =   1032
      ButtonHeight    =   1005
      Appearance      =   1
      ImageList       =   "IL2"
      _Version        =   327682
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   9
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "Kugel"
            Object.ToolTipText     =   "Kugel"
            Object.Tag             =   ""
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "Kegel"
            Object.ToolTipText     =   "Kegel"
            Object.Tag             =   ""
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "Zylinder"
            Object.ToolTipText     =   "Zylinder"
            Object.Tag             =   ""
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "W�rfel"
            Object.ToolTipText     =   "W�rfel"
            Object.Tag             =   ""
            ImageIndex      =   4
         EndProperty
         BeginProperty Button5 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "Quader"
            Object.ToolTipText     =   "Quader"
            Object.Tag             =   ""
            ImageIndex      =   5
         EndProperty
         BeginProperty Button6 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "Pyramide"
            Object.ToolTipText     =   "Pyramide"
            Object.Tag             =   ""
            ImageIndex      =   6
         EndProperty
         BeginProperty Button7 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "Prisma"
            Object.ToolTipText     =   "Prisma"
            Object.Tag             =   ""
            ImageIndex      =   7
         EndProperty
         BeginProperty Button8 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "Disc"
            Object.ToolTipText     =   "Disc"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button9 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "Ebene"
            Object.ToolTipText     =   "Ebene"
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin ComctlLib.ImageList IL2 
      Left            =   3840
      Top             =   360
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   7
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "3d_Form2.frx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "3d_Form2.frx":0C52
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "3d_Form2.frx":18A4
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "3d_Form2.frx":24F6
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "3d_Form2.frx":3148
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "3d_Form2.frx":3D9A
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "3d_Form2.frx":49EC
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "F2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'****************************************************************************************
'  Modul: F2.Frm                 3 D - B A U K A S T E N                Version: 1.2 Beta
'========================================================================================
'  Programmbeschreibung: Modul F2                                       Datum:  30.1.2002
'
'****************************************************************************************
'           Programm: Form F2 bewegliche Toolbar2 zu 3D_Baukasten     Version 1.2
'           F2: ToolBar zum Ausw�hlen der verschiedenen K�rper(Kugel,Kegel,...)
'           Besonderheit: Das F2 bleibt immer an der Oberfl�che sichtbar.
'****************************************************************************************

Private Declare Function SetWindowPos& Lib "user32" (ByVal hwnd&, ByVal WndInsertAfter&, ByVal x&, _
                                                     ByVal y&, ByVal cx&, ByVal cy&, ByVal wFlags&)

Private Const SWP_SHOWWINDOW = &H40
Private Const HWND_TOPMOST = -1


'****************************************************************************************

Private Sub Form_Resize()
  SetWindowPos F2.hwnd, HWND_TOPMOST, Left / Screen.TwipsPerPixelX, Top / Screen.TwipsPerPixelY, _
  Width / Screen.TwipsPerPixelX, Height / Screen.TwipsPerPixelY, SWP_SHOWWINDOW
End Sub

'***         Auswahl der K�rper und R�ckgabe an das Form1           ***/

Private Sub TB2_ButtonClick(ByVal Button As ComctlLib.Button)
   Itool2 = Button.Index            'Index global bekanntgeben
   F4.SSTab1.Tab = 0                'K�rper-Registerblatt nach vorne bringen
   F4.CB1.Text = Button.Key         'Namen im Toolbar TB2 und ComboBox CB1 m�ssen
                                    '�bereinstimmen!!
   Call Form1.Start_Mark            'Defaultposition
 Call F4.CB1_Click                  'Aufruf der Combobox CB1 simulieren
End Sub

'****************************************   E O F   **********************************************

