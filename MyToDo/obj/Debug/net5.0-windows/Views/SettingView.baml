   M S B A M L   `   `   `  ����A  =MyToDo, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:MyToDo.ViewsMyToDo.Views  5      5clr-namespace:MyToDo.ExtensionsMyToDo.Extensions  5          MyToDo.Views.SettingView   5      W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5      R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:MyToDo.Views     5      Jmd;http://schemas.openxmlformats.org/markup-compatibility/2006     5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5	      [	 WPrism.DryIoc.Wpf, Version=8.1.97.5141, Culture=neutral, PublicKeyToken=40ee6c3a2184dc59T
 PPrism.Wpf, Version=8.1.97.5141, Culture=neutral, PublicKeyToken=40ee6c3a2184dc59&prismhttp://prismlibrary.com/ 	 
 5
      +extclr-namespace:MyToDo.Extensions 	 
 5      .��5      �   � RowDefinitions  5   
   �� 5      $
��auto �6   �� 5      .+�5   
   �� $��Setting��6   $��25(�6$   $
��Bold"�62   $��2��6D   $��20,20q�6X   �� 5   
   ���#DDDDDD$��0,0,0,1q�6'   $��2��6A   � 5   
   $��1��6    � ColumnDefinitions 5      �� 5      $��1* �6#   �� 5      $��4* �6#   .+�5      �� -   5         ��Name$ menuBar��5   +   $��
3,10,10,10q�6      MyListBoxItemStyle#��[  6<   $��0��6�   ��6u   �� *
MenuBars+*  $Microsoft.Xaml.Behaviors.Interaction   Triggers 5      +  %Microsoft.Xaml.Behaviors.EventTrigger  5         	EventName$ SelectionChanged��6%   *  $Microsoft.Xaml.Behaviors.TriggerBase   Actions. 5      2  ,Microsoft.Xaml.Behaviors.InvokeCommandAction     Command 60   �� *NavigateCommmand+   CommandParameter 6U   ��  �� ElementName$ menuBar��	 �� Path$	 SelectedItem�5       ��5"      �� 5#      .R�5$      �� 
 �� Orientation$
 
Horizontal=�6%   .+�5%      '  !MaterialDesignThemes.Wpf.PackIcon  $
��15,0q�66      Kind 6D   �� *Icon+�� 5&      $
��10,0q�6(   ��66   �� *Title+5'      5(      5*      �� 5+      $��1��5,      $��	20,0,20,0q�5-      $   MyToDo.Extensions.PrismManager   SettingsViewRegionName! 
 Prism.Regions.RegionManager   
RegionName# Z 5.      5/      51      54      