def execute_cmd(cmd):
    import subprocess

    stdout = subprocess.Popen(cmd, stdout = subprocess.PIPE, stderr = subprocess.PIPE).stdout

    return stdout.read().split()

access_token = execute_cmd(['pass', 'show', 'GitHub/GripToken'])

PASSWORD = access_token[0].decode('utf-8')

QUIET = True
