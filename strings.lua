function data()
return {
	en = {
		mod_desc = [[
With this mod, assets of >all< vehicles (including mods) can be placed.
In the category 'Vehicles' are the following types:
-Locomotives
-Wagons
-Multiple Units
-Buses
-Trucks
-Trams
-Ships
-Airplanes

This is a pure script mod and does not contain any models, it accesses the existing ones, which has pros and cons.
The vehicle mdl directly as an asset can cause undesirable effects with smoke, lights, colors, dirt.
It is not possible to make these adjustments by script, I tried that.
In some cases, a dedicated asset mod is probably better.

Benefits:
-no line and maneuvering necessary
-Savegame compatible (since no own models)
-Asset clickable and modifiable
-Centimeter-precise shift, so that perfect "coupling" of wagons is possible
-Promille-precise slope so that the assets can also be used on uneven ground

Disadvantages:
-All models smoke (stronger than usual, therefore recommended: smoke reduction)
-Lights are always on
-Color cannot be changed

Within each vehicle category, the vehicles can be selected via a combo box and are sorted by availability year.
Logo materials are filtered out, as the vanilla vehicles have remains of TPF1 logos.
]],
		con_name = "Vehicle Asset Builder",
		con_desc_locomotive = "Locomotives",
		con_desc_waggon = "Wagons",
		con_desc_multiple = "Multiple Units (only)",
		con_desc_bus = "Buses",
		con_desc_truck = "Trucks",
		con_desc_tram = "Trams",
		con_desc_ship = "Ships",
		con_desc_plane = "Airplanes",
		offz_tt = "Rail height: 1.05",
	},
	de = {
		mod_desc = [[
Mit dieser Mod lassen sich Assets von >allen< Fahrzeugen (auch Mods) platzieren.
Sie sind in der Kategorie 'Vehicles' nach folgenden Typen einsortiert: 
-Lokomotiven
-Waggons
-Multiple Units
-Busse
-Lastwagen
-Trams
-Schiffe
-Flugzeuge

Dies ist eine reine Skript-Mod und enthält keine Modelle, sondern greift auf die vorhandenen zu, was Vor- und Nachteile mit sich bringt.
Die Fahrzeug-mdl direkt als Asset kann unerwünschte Effekte bei Dampf, Licht, Farbe, Schmutz hervorrufen.
Diese Anpassungen skript-seitig durchzuführen ist nicht möglich, ich habe es versucht.
Für manche Fälle ist man daher mit einer dedizierten Asset-Mod besser beraten.

Vorteile:
-keine Linie und Rangieren nötig
-Savegame kompatibel (da keine eigenen Modelle)
-Asset anklickbar und modifizierbar
-Centimeter-genaue Verschiebung, sodass perfektes "Ankuppeln" von Waggons möglich ist
-Promille-genaue Neigung, damit man die Assets auch in Steigungen verwenden kann

Nachteile:
-Alle Modelle rauchen grundsätzlich (stärker als sonst, daher empfohlen: Smoke Reduktion)
-Licht immer an 
-Farbe nicht änderbar

Innerhalb jeder Fahrzeugkategorie sind die Fahrzeuge über eine ComboBox auswählbar und nach Erscheinungsjahr sortiert.
Logo-Materialen werden rausgefiltert, da bei den Vanilla-Fahrzeugen noch Übereste von TPF1-Logos vorhanden sind.
]],
		con_desc_locomotive = "Lokomotiven",
		con_desc_waggon = "Waggons",
		con_desc_multiple = "Multiple Units (only)",
		con_desc_bus = "Busse",
		con_desc_truck = "Lastwagen",
		con_desc_tram = "Trams",
		con_desc_ship = "Schiffe",
		con_desc_plane = "Flugzeuge",
		Model = "Modell",
		Length = "Länge",
		Vehicle = "Fahrzeug",
		Slope = "Neigung",
		offz_tt = "Schienenoberkante: 1.05",
	}
}
end