{ pkgs, ... }:

{
	environment.systemPackages = [
		pkgs.freecad
	];

	environment.etc."xdg/applications/freecad.desktop".text = ''
		[Desktop Entry]
		Type=Application
		Name=FreeCAD
		GenericName=CAD Modeler
		Comment=Parametric 3D CAD Modeler
		Exec=env QT_QPA_PLATFORM=xcb freecad %F
		Icon=freecad
		Categories=Graphics;Engineering;
		Terminal=false
	'';
}
