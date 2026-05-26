# Linux Cron Automation Project

## Features
- Automated backups
- System monitoring
- Health checks
- Cleanup automation
- Log rotation
- Alert notifications

## Technologies Used
- Bash Shell Scripting
- Linux Cron Jobs
- Ubuntu EC2

## Scripts
- backup.sh
- monitor.sh
- cleanup.sh
- health_check.sh
- log_rotate.sh
- email_alert.sh

## Author
Bhuvan NB
Email: bhuvananb33111@gmail.com
Gitub: https://github.com/bhuvana-nb


## 📁 Project Structure

```bash
├── README.md
├── backups
│   ├── backup_20260522_070522.tar.gz
│   ├── backup_20260522_071031.tar.gz
│   ├── backup_20260522_071727.tar.gz
│   ├── backup_20260525_231817.tar.gz
│   ├── backup_20260525_232238.tar.gz
│   ├── backup_20260525_232638.tar.gz
│   └── backup_20260525_233317.tar.gz
├── config
│   └── settings.conf
├── logs
│   ├── alerts.log
│   ├── archive
│   │   ├── alerts.log_20260522_110705
│   │   ├── backup.log_20260522_110705
│   │   └── monitor.log_20260522_110705
│   ├── backup.log
│   ├── cleanup.log
│   ├── health.log
│   ├── health_report.log
│   └── monitor.log
├── project_structure.txt
└── scripts
    ├── backup.sh
    ├── cleanup.sh
    ├── email_alert.sh
    ├── health_check.sh
    ├── log_rotate.sh
    └── monitor.sh
```
