# LifeLab+

![LifeLab+ App-Oberfläche - Bildschirm 1](2017_lifelab_app_interface_combined1.png)

![LifeLab+ App-Oberfläche - Bildschirm 2](2017_lifelab_app_interface_combined2.png)

## Zusammenfassung

LifeLab+ ist ein nutzergeleitetes Serious Game und eine digitale Gesundheitsintervention, entwickelt im Rahmen des Forschungsprogramms **EACH-B (Einbindung von Jugendlichen in Verhaltensänderung)** - einer großen cluster-randomisierten kontrollierten Studie, die auf die Verbesserung von Ernährungs- und Bewegungsverhalten bei Teenagern fokussiert ist. Beauftragt unter NIHR (Nationales Institut für Gesundheitsforschung) und in Zusammenarbeit mit der MRC-Einheit an der University of Southampton entwickelt, verband das Projekt Verhaltenspsychologie mit Spieldesign, um bedeutungsvolle, messbare Beteiligung zu fördern. Die EACH-B-Studie richtet sich an etwa 2.300 Schülerinnen und Schüler im Alter von 12–13 Jahren aus 50 Schulen, wobei LifeLab+ als interaktive digitale Komponente neben einem dreiwöchigen naturwissenschaftlichen Curriculum und einer Lehrkräftefortbildung dient. Das Programm erhielt eine besondere Anerkennung bei den IEGC Awards 2020. Das Gesamtprojektbudget betrug £2,2 Mio., davon £330 Tsd. für das Spiel.

## Entwicklungsdetails

- **Co-Design-Methodik**: Wir bezogen Jugendliche als Mitgestalterinnen und Mitgestalter ein, nicht nur als Testerinnen und Tester. Über iterative Zyklen hinweg prägten die teilnehmenden Teenager die Konzeptbildung, Interaktionsmuster, Aufgabenthemen und den Tonfall. Strukturierte Workshops, Rapid Prototyping und durch In‑App-Telemetrie informierte Feedbackschleifen stellten sicher, dass Designentscheidungen jugendzentriert blieben.

- **Integration der Verhaltenswissenschaften**: Wir überführten psychologische Prinzipien (z. B. Motivation, Selbstwirksamkeit, Gewohnheitsbildung, Zielsetzung, soziale Verstärkung) in Mechaniken, die kleine, nachhaltige Verhaltensänderungen fördern. Gameplay-Loops wurden mit evidenzbasierten Techniken der Verhaltensänderung abgeglichen und in zugängliche Herausforderungen und Mikrobelohnungen übersetzt.

- **Forschungspartnerschaft**: Im Rahmen der cluster-randomisierten kontrollierten EACH-B-Studie arbeiteten wir mit der MRC-Einheit an der University of Southampton zusammen, um Design-Sprints mit Forschungsmeilensteinen und Evaluationsbedarfen abzustimmen. Die App wurde auf Grundlage der Selbstbestimmungstheorie und von Techniken der Verhaltensänderung gestaltet, sodass das Produkt robuste Studiendesigns unterstützen konnte und zugleich ansprechend und altersgerecht blieb. Gemessene sekundäre Endpunkte umfassen Verhaltensselbstregulation, Selbstwirksamkeit für gesundes Essen und körperliche Aktivität sowie Lebensqualitätsmaße.

- **Governance und Umsetzung**: Mehrjährige Roadmap (2017–2022), umgesetzt über agile Delivery. Regelmäßige Ethik- und Schutzprüfungen, Beiträge eines jugendlichen Beirats sowie Data-Governance-Checkpoints informierten das Release-Gating. Wir verantworteten einen £330k-Workstream innerhalb des £2,2 Mio.-Programms, der Experience-Design, App-Architektur, Feature-Implementierung und Analytics-Instrumentierung abdeckte.

- **Anerkennung**: Die besondere Anerkennung bei den IEGC Awards 2020 hob die innovative Verbindung aus jugendgeleitetem Design und der Umsetzung von gesundheitsbezogener Verhaltensänderung hervor.

## Technische Aspekte

- **Hub-and-Spoke-Architektur**: Ein zentraler "Hub" koordinierte den Zugriff auf modulare "Spokes", darunter:
  • Verhaltensherausforderungen für Ernährung und körperliche Aktivität, mit gestufter Schwierigkeit und streak-basierter Fortschritt
  • Gewohnheitsverfolgung und Mikrozielsetzung, mit kontextuellen Anstupsern
  • Pädagogische Minispiele und interaktive Lernmodule
  • Reflexionsräume und Fortschrittsvisualisierung
  
  Diese Architektur ermöglichte die unabhängige Weiterentwicklung der Spokes, sichereres Experimentieren und das schnelle Austauschen von Inhalten oder Mechaniken, ohne den Kern zu destabilisieren.

- **Modulare Inhalts-Pipeline**: Ein strukturiertes Inhaltsmodell trennte Narrativ, Assets und Konfiguration und ermöglichte es nicht-technischen Teams, Herausforderungen, Tipps und Belohnungen zu erstellen und zu aktualisieren. Feature-Flags und Konfigurationstoggles unterstützten kontrollierte Rollouts, A/B-Vergleiche und Forschungskohorten.

- **Adaptive Feedbackschleifen**: Engagementsignale (Abschlussraten, Verweildauer, Integrität von Streaks) informierten Just-in-Time-Aufforderungen, Schwierigkeitsanpassungen und Belohnungskalibrierung. Das System konnte Intensität und Kadenz anpassen, um Abbrüche zu reduzieren und die Festigung von Gewohnheiten zu unterstützen.

- **Analytics für Forschung und Iteration**: Telemetrie auf Event-Ebene unterstützte die Messung von Engagement, Einhaltung von Herausforderungen und Fortschritt durch Lernmodule. Exportpfade ermöglichten datenschutzwahrende Aggregation für Forschungsanalysen. Die Instrumentierung wurde in Zusammenarbeit mit Forschenden gestaltet, um mit Studienendpunkten in Einklang zu stehen und zugleich eine ansprechende UX zu erhalten.

- **Datenschutz und Sicherheit**: Privacy-by-Design-Prinzipien informierten Datenminimierung, Einwilligungs-/Zustimmungsabläufe, die für Jugendliche geeignet sind, sowie die Verschlüsselung von Daten in Transit und im Ruhezustand. Audit-Trails und rollenbasierte Kontrollen unterstützten Forschungsintegrität und Schutzanforderungen.

## Wirkung/Bedeutung

- **Förderung nutzergeleiteter gesundheitsbezogener Verhaltensänderung**: LifeLab+ zeigt, wie Co-Design mit Jugendlichen von der Beratung zur Kernproduktion erhoben werden kann und direkt Mechaniken prägt, die mit den Motivationen von Teenagern in Resonanz stehen. Dies stärkte Engagementtreiber, die für Verhaltensänderungen in den Bereichen Ernährung und körperliche Aktivität entscheidend sind.

- **Psychologie ins Spiel übersetzen**: Das Projekt operationalisierte Verhaltenskonstrukte in Spielsysteme—Zielgradienten, Streaks, rechtzeitige Aufforderungen und soziale Verstärkung—ohne auf plumpe Gamification zurückzugreifen. Dieses Gleichgewicht steigerte sowohl die Einhaltung als auch die wahrgenommene Autonomie.

- **Eine replizierbare Architektur für Serious Games im Gesundheitsbereich**: Das Hub-and-Spoke-Modell, analytische Instrumentierung und die modulare Inhalts-Pipeline bilden eine wiederverwendbare Blaupause für zukünftige digitale Gesundheitsinterventionen, die Experimente, Kohortenmanagement und laufende Inhaltsaktualisierung erfordern.

- **Forschungsbereit und zugleich jugendfreundlich**: Durch die Ausrichtung der technischen Instrumentierung an Forschungsfragen unterstützt das Produkt robuste Evaluationen, ohne die User Experience zu beeinträchtigen—eine häufige Hürde bei Gesundheits-Apps für junge Menschen.

- **Anerkannte Innovation und Glaubwürdigkeit im Sektor**: Die besondere IEGC-Anerkennung und die NIHR/MRC-Zusammenarbeit unterstreichen LifeLab+ als glaubwürdiges, preisgekröntes Exemplar an der Schnittstelle von Games, Designforschung und öffentlicher Gesundheit.

- **Kapazitätsaufbau**: Das Projekt trug dazu bei, gemeinsame Praktiken zwischen Spieleentwicklern und Gesundheitsforschenden zu etablieren und zeigte, wie Interventionen koproduziert werden können, die evidenzinformiert, ethisch fundiert und für die Zielgruppe ansprechend sind.

Unser Beitrag konzentrierte sich darauf, Erkenntnisse von Jugendlichen und Verhaltenswissenschaft in ein wartbares, forschungsfähiges und fesselndes Produkt zu überführen. LifeLab+ steht als Modell dafür, wie Serious Games durch rigoroses Co-Design, durchdachte Architektur und messbares Engagement realen Mehrwert im digitalen Gesundheitswesen liefern können.

---

**Projektdauer**: 2017-2022  
**Auftraggeber**: NIHR (Nationales Institut für Gesundheitsforschung)  
**Budget**: £2,2 Mio. Gesamtprojekt (£330 Tsd. für das Spiel)  
**Auszeichnungen**: Besondere Anerkennung, 2020 IEGC Awards