{% include-markdown './logs.gen.md' %}

## How It Works

The `quix deployment logs` command allows you to retrieve logs for a specific deployment. This command helps you monitor and debug your deployments by providing access to their log outputs.

## Example Usage

{% include-markdown '../utils/tip-use.md' %}

### Interactive Mode

```bash
$ quix deployment logs

? Select deployment:
  deployment-1
  deployment-2
  deployment-3
> deployment-4
  ✗ Cancel

[ - Logs stream started - ]

{'Motion_WorldPositionZ': -39.90142059, 'Motion_WorldPositionY': 91.49635314941406,
'Motion_WorldPositionX': -348.5354004, 'TotalLapDistance': -3646.724854, 'Steer': 0.0, 'Speed': 0,
'LapDistance': -3646.724854, 'Gear': 0, 'EngineTemp': 90, 'EngineRPM': 3503, 'Brake': 0.0,
'DriverStatus': 'In_garage', 'LapNumber': 1, 'LapValidity': 'Valid', 'PitStatus': 'Pitting',
'Sector': 0}
...
```

### Non-Interactive Mode

```bash
$ quix deployment logs deployment-4

[ - Logs stream started - ]

{'Motion_WorldPositionZ': -39.90142059, 'Motion_WorldPositionY': 91.49635314941406,
'Motion_WorldPositionX': -348.5354004, 'TotalLapDistance': -3646.724854, 'Steer': 0.0, 'Speed': 0,
'LapDistance': -3646.724854, 'Gear': 0, 'EngineTemp': 90, 'EngineRPM': 3503, 'Brake': 0.0,
'DriverStatus': 'In_garage', 'LapNumber': 1, 'LapValidity': 'Valid', 'PitStatus': 'Pitting',
'Sector': 0}
...
```

!!! note
    You can also dump the logs to a file by using the `--file` option.
