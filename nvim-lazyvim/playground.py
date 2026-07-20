"""Übungsdatei für das LazyVim-Kata (siehe README.md)."""


def berechne_summe(zahlen: list[int]) -> int:
    """Addiert alle Zahlen in der Liste."""
    ergebnis = 0
    for zahl in zahlen:
        ergebnis += zahl
    return ergebnis


def berechne_durchschnitt(zahlen: list[int]) -> float:
    gesamt = berechne_summe(zahlen)
    anzahl = len(zahlen)
    return gesamt / anzahl


def verarbeite_daten(werte: list[int], teiler: int) -> float:
    """Enthält absichtlich einen Bug: teiler kann 0 sein."""
    summe = berechne_summe(werte)
    return summe / teiler


def main() -> None:
    zahlen = [10, 20, 30, 40]
    print("Summe:", berechne_summe(zahlen))
    print("Durchschnitt:", berechne_durchschnitt(zahlen))
    print("Verarbeitet:", verarbeite_daten(zahlen, 2))


if __name__ == "__main__":
    main()
