# Resumen diario de emails → Telegram

Cada día a las 10:00 (Madrid) revisa los emails recibidos desde las 10:00 del día anterior,
Claude decide cuáles son importantes y te manda un resumen por Telegram.

## Configuración

1. **Telegram**: habla con `@BotFather` → `/newbot` → guarda el token. Escribe cualquier mensaje a tu bot y abre
   `https://api.telegram.org/bot<TOKEN>/getUpdates`; tu `chat_id` está en `message.chat.id`.
2. **Gmail**: activa la verificación en 2 pasos, comprueba que IMAP está habilitado
   (Ajustes → Reenvío y POP/IMAP) y crea una contraseña de aplicación en
   https://myaccount.google.com/apppasswords
3. **Anthropic**: crea una API key en https://console.anthropic.com con algo de crédito.
4. **GitHub**: sube esta carpeta a un repo **privado** y añade en Settings → Secrets and variables → Actions:
   `GMAIL_ADDRESS`, `GMAIL_APP_PASSWORD`, `ANTHROPIC_API_KEY`, `TELEGRAM_BOT_TOKEN`, `TELEGRAM_CHAT_ID`.

## Pruebas

- Local: `pip install -r requirements.txt`, define las variables de entorno y ejecuta
  `DAYS=3 python main.py --dry-run` (imprime en vez de enviar).
- GitHub: pestaña Actions → "Resumen diario de emails" → Run workflow (campo `days` opcional).

## Notas

- GitHub puede retrasar el cron 5-30 min. Los repos sin actividad 60 días pierden los crons programados:
  si pasa, reactívalos desde la pestaña Actions.
- No lee ni marca nada: IMAP en solo lectura y `BODY.PEEK`.
