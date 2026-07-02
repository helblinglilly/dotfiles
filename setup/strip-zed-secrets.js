#!/usr/bin/env node
// Git clean filter for zed/settings.json
// Reads JSONC from stdin, strips context_servers[*].settings, writes JSON to stdout.
// The file is JSONC (allows // comments and trailing commas) so we pre-process it
// before parsing with JSON.parse.

const chunks = [];
process.stdin.on('data', (d) => chunks.push(d));
process.stdin.on('end', () => {
  const raw = Buffer.concat(chunks).toString('utf8');

  // Strip single-line // comments (but not inside strings)
  // and trailing commas before } or ]
  const stripped = raw
    .replace(/("(?:[^"\\]|\\.)*")|\/\/[^\n]*/g, (m, str) => str ?? '')
    .replace(/,(\s*[}\]])/g, '$1');

  let obj;
  try {
    obj = JSON.parse(stripped);
  } catch (e) {
    process.stderr.write(`strip-zed-secrets: failed to parse settings.json: ${e.message}\n`);
    process.exit(1);
  }

  // Remove secrets from all context server settings blocks
  if (obj.context_servers) {
    for (const key of Object.keys(obj.context_servers)) {
      delete obj.context_servers[key].settings;
    }
  }

  process.stdout.write(JSON.stringify(obj, null, 2) + '\n');
});
