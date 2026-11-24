Schematron-Validierung (SVRL aus PlanPro-XML)

* Verzeichnis 'LIZENZEN':

  - 'Lizenzen.txt' (Übersicht über verwendete Software-Bestandteile,
    deren Copyright und Lizenzen)

  - Copyright-Hinweise und Lizenzen für die verwendeten
    Software-Bestandteile

* Verzeichnis 'Regeln':

  - Die in Einzeldateien separierten Schematron-Pattern werden in
    Unterverzeichnissen je Arbeitspaket erwartet.

    Die Einzeldateien sind für sich genommen keine validen
    Schematron-Dateien!

  - Die Regelbasis-Datei (Regelbasis.sch) enthält den Import der
    Einzeldateien, deren Gruppierung in Schematron-Phases, für die
    Validierung und Erzeugung von Bezeichnungen notwendige Funktionen
    und Keys, die Definition diverser XSL-Variablen für die Erzeugung
    geeigneter Bezeichnungen, die Parameter für die Erzeugung
    geeigneter Bezeichnungen, Objekt-GUID und Objekt-Typ.

* Verzeichnis 'Schematron':

  Für die XSL-Prozessierungen wird der Saxon-HE 12.9 verwendet. 
  Die Dateien in diesem Ordner sind teilweise gegenüber den anderweitig 
  öffentlich verfügbaren Versionen angepasst. Die Veränderungen können 
  in der Versionsdokumentation in den jeweiligen Dateien nachvollzogen 
  werden.

  Für die Schematron-Validierung einer PlanPro-Datei sind folgende
  Schritte durchzuführen:

  1. Inkludieren der Einzelregeln in die Regelbasis Transformation der
     Datei 'Regelbasis.sch' mit 'iso_dsdl_include.xsl' ergibt
     'Regelbasis_included.sch'

  2. Ersetzen der abstrakten Regeln durch deren Instanzen
     Transformation der Datei 'Regelbasis_included.sch' mit
     modifiziertem 'iso_abstract_expand.xsl' ergibt
     'Regelbasis_expanded.sch'

  3. Überführen der Schematron-Regeln in ein ausführbares XSL-Skript
     Transformation der Datei 'Regelbasis_expanded.sch' mit
     modifiziertem 'iso_svrl_for_xslt2.xsl' und gesetztem Parameter
     'allow-foreign="true"' ergibt 'Regelbasis_compiled.sch'
     
  4. Validieren der PlanPro-Datei (ggf. in einem anderen Verzeichnis)
     Transformation der PlanPro-Datei mit 'Regelbasis_compiled.sch'
     ergibt PlanPro-SVRL-Datei

  Wenn der 1. Schritt (Include) durchgeführt wurde, sollte eine valide
  Schematron-Datei (Regelbasis_included.sch) vorhanden sein.
  Andernfalls müssen die Fehler analysiert werden, um ein
  zweifelsfreies Funktionieren der Regeln sicher zu stellen.

PDF-Erstellung

* Verzeichnis 'XSLs':

  - Für die Generierung der FO-Dateien als Grundlage für den
  fop-Prozessor werden folgende XSL-Skripte benötigt:
  ‚GroupedSVRL.xsl‘, ‚HierarchicalSVRL.xsl‘, ‚svrl2any-base.xsl‘,
  ‚svrl2xslfo.xsl‘; zudem die XML-Datei ‚AP-Objektzuordnung.xml‘
  
  - Signifikant schneller ist die Prozessierung mit Hilfe einer 
  Zwischendatei, die eine umstruktrierte SVRL-Validierungsausgabe 
  beinhaltet. Dafür werden zwei Transformationen unter Nutzung 
  obiger Stylesheets hintereinander durchgeführt.
  1. svrl2gsvrl.xsl mit der SVRL-Datei als input und *.gsvrl als Output
  2. gsvrl2xslfo.xsl mit *.gsvrl als Input und *.fo als Output

  - Der FO-Generierungsprozess kann durch folgende Parameter gesteuert
    werden:

   ‚notAvailable‘ definiert den Text, der im Report angezeigt wird,
   falls ein erwarteter Wert nicht vorhanden ist.  Falls dieser
   Parameter nicht beim XSL-Prozess gesetzt wird, kommt der
   Standardausdruck ‚Angabe nicht verfügbar‘ zur Anwendung.

   ‚detailliertes-dokument‘ definiert, ob die mehrseitige
   ‚Vollständige Dokumentation‘ oder die einseitige ‚Übersicht‘
   generiert werden sollen.  Falls dieser Parameter nicht beim
   XSL-Prozess gesetzt wird, kommt die ‚Vollständige Dokumentation‘
   durch ‚true()‘ zur Anwendung.

   ‚schema-valid‘ definiert, ob die im Werkzeugkoffer durchgeführte
   XSD-Validierung positiv oder negativ verlief. Falls dieser
   Parameter nicht beim XSL-Prozess gesetzt wird, kommt die
   fehlgeschlagene XSD-Validierung, also ein invalides XML-Dokument,
   durch ‚false()‘ zur Anwendung.
   
   ‚tool-stamp‘ definiert den Ausgabetext für die PDF-Fußzeile, die
   über das generierte Software-Tool und dessen Version
   informiert. Falls dieser Parameter nicht beim XSL-Prozess gesetzt
   wird, kommt der String ‚PlanPro-Werkzeugkoffer, Version 0.0.0‘ zur
   Anwendung.

   ‚planpro-dateiname‘ definiert den Ausgabetext für den dargestellten
   Dateinamen der geprüften PlanPro-Datei auf dem Deckblatt im PDF,
   in den Kopfzeilen im PDF und im Tabellenkopf im HTML. Dabei wird
   _keine_ Dateiendung, wie '.zip', '.xml' oder '.ppxml' angehängt.
   Falls dieser Parameter nicht beim XSL-Prozess gesetzt wird, kommt
   der String ‚unbekannt.xml‘ zur Anwendung.

   ‚MAX_OBJECT_COUNT_IN_PDF‘ definiert, wieviele detaillierte
   Feststellungen pro Regel im Planungs-/Betrachtungsbereich 
   in der PDF-Datei höchstens enthalten sein sollen. Der Wert '0' 
   hebelt diesen Mechanismus aus und bewirkt, dass alle vorhandenen
   Feststellungen detailliert beschrieben werden.
   Die Anzahlen an Feststellungen auf der Titelseite umfassen immer alle
   vorhandenen Feststellungen, unabhängig davon, ob diese in dieser
   PDF-Datei detailliert ausgeführt sind, oder aufgrund der Menge
   weggelassen wurden. Falls dieser Parameter nicht beim XSL-Prozess
   gesetzt wird, kommt der Integer ‚50‘ zur Anwendung.
   
   ,logo-path‘ definiert den relativen Pfad zur Logo-Grafik-Datei

* Verzeichnis 'Pictures':

  - Für die Generierung der PDF-Dateien benötigt der fop-Prozessor die
    hier enthaltenen SVG-Bilder

* Verzeichnis 'fop-support':

  - Falls der folgende Fehler beim Start des fop-Prozessors mit den
    PlaZ-FO-Dateien auftritt, fehlt die Datei 'fop-hyph.jar'.

  org.apache.fop.hyphenation.Hyphenator getHyphenationTree
  SCHWERWIEGEND: Couldn't find hyphenation pattern for lang="de".

  --> (https://xmlgraphics.apache.org/fop/2.1/hyphenation.html)

  - Für diesen Fall wird die zugeschnittene Datei 'fop-hyph.jar' im
    Verzeichnis 'fop-support' mitgeliefert. Sie enthält nur die
    Trennmuster (hyphenation patterns) für die Deutsche Sprache
    entsprechend der Neuen Rechtschreibung und unterliegt der LPPL.

  --> (https://de.wikipedia.org/wiki/LaTeX_Project_Public_License)

  - Diese deutschen Trennmuster wurden aus dem OFFO-Projekt ('Objects
    For Formatting Objects') extrahiert.

  --> (https://sourceforge.net/projects/offo/files/offo-hyphenation/2.2/offo-hyphenation-compiled.zip/download)

  - 'fop-hyph.jar' ins Verzeichnis 'fop-2.1/lib' oder 'fop-2.1/build'
    kopieren. Diese Verzeichnisse sind im Systembereich, nicht im
    Nutzerbereich verortet und im Allgemeinen im Java-Classpath
    enthalten.

  - Datei 'fop.xconf' (Konfigurationsdatei für den fop-Prozessor)
  beinhaltet das automatische Laden der Schriftschnitte aus dem
  Verzeichnis 'font'

  - Der fop-Prozess wird somit wie folgt gestartet.
  
  fop -c fop.xconf <Datei.fo> <Datei.pdf>

  - Für die FOP-Prozessierungen wird der fop-2.1 verwendet.

* Problembehebung für die Fehlermeldung"java.lang.OutOfMemoryError:
  Java heap space"

  export FOP_OPTS='-Xmx512m'

  - Für die Beispieldateien P-Hausen und Rummelsburg genügte dieser
    Speicherbedarf. Mit anderen realen Daten könnte es anders
    aussehen. Diese Java-Konfiguration muss beim Werkzeugkoffer
    berücksichtigt werden.

* PDF-Beispielausgaben

    PDF-Beispielausgaben befinden sich auf dem SharePoint-Server
    unter „Testdaten/Beispielausgabe/*.pdf“.

HTML-Erstellung

* Verzeichnis 'XSLs':

  - Für die Generierung der HTML-Dateien werden folgende XSL-Skripte
  benötigt: ‚GroupedSVRL.xsl‘, ‚HierarchicalSVRL.xsl‘,
  ‚svrl2any-base.xsl‘, ‚svrl2html.xsl‘; zudem die XML-Datei
  ‚AP-Objektzuordnung.xml‘

  
  - Signifikant schneller ist die Prozessierung mit Hilfe einer 
  Zwischendatei, die eine umstruktrierte SVRL-Validierungsausgabe 
  beinhaltet. Dafür werden zwei Transformationen unter Nutzung 
  obiger Stylesheets hintereinander durchgeführt.
  1. svrl2gsvrl.xsl mit der SVRL-Datei als input und *.gsvrl als Output
  2. gsvrl2html.xsl mit *.gsvrl als Input und *.html als Output

  - Der HTML-Generierungsprozess kann durch folgende Parameter
    gesteuert werden:

   ‚notAvailable‘ definiert den Text, der im Report angezeigt wird,
   falls ein erwarteter Wert nicht vorhanden ist.  Falls dieser
   Parameter nicht beim XSL-Prozess gesetzt wird, kommt der
   Standardausdruck ‚Angabe nicht verfügbar‘ zur Anwendung.

   ‚detailliertes-dokument‘ definiert, ob die mehrseitige
   ‚Vollständige Dokumentation‘ oder die einseitige ‚Übersicht‘
   generiert werden sollen.  Falls dieser Parameter nicht beim
   XSL-Prozess gesetzt wird, kommt die ‚Vollständige Dokumentation‘
   durch ‚true()‘ zur Anwendung.

   ‚schema-valid‘ definiert, ob die im Werkzeugkoffer durchgeführte
   XSD-Validierung positiv oder negativ verlief. Falls dieser
   Parameter nicht beim XSL-Prozess gesetzt wird, kommt die
   fehlgeschlagene XSD-Validierung, also ein invalides XML-Dokument,
   durch ‚false()‘ zur Anwendung.

   ,logo-path‘ definiert den relativen Pfad zur Logo-Grafik-Datei
   
* Verzeichnis 'Pictures':

  - Für die Darstellung/Nutzung der HTML-Dateien im Browser werden die
    hier enthaltenen SVG-Bilder benötigt

* Verzeichnis 'JS':

  - Für die Darstellung/Nutzung der HTML-Dateien im Browser werden die
    hier enthaltenen JavaScript- and CSS-Dateien benötigt
