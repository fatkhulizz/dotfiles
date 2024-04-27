#!/usr/bin/python3

import argparse
import subprocess
import json


def getWorkspace():
    res = subprocess.run(
        ["i3-msg", "-t", "get_workspaces"], capture_output=True, text=True
    )
    workspaces = json.loads(res.stdout)
    for workspace in workspaces:
        if workspace["focused"]:
            return workspace["name"]
    return None


def main(args):
    workspace = getWorkspace()
    if workspace != None:
        int_step = int(workspace) + args.step
        if int_step > 10:
            int_step -= 10
        elif int_step <= 0:
            int_step += 10
        step = str(int_step)

        if args.action == "switch":
            subprocess.run(["i3-msg", "-t", "run_command", "workspace number", step])
        elif args.action == "move":
            subprocess.run(
                [
                    "i3-msg",
                    "-t",
                    "run_command",
                    "move container to workspace number %s, workspace number %s"
                    % (step, step),
                ]
            )
        else:
            print("Invalid action")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="i3 Script to [switch|move window] to [next|previous] workspace, sort by number"
    )
    parser.add_argument("action", choices=["switch", "move"], help="Action to perform")
    parser.add_argument("step", type=int, help="Workspace step")

    args = parser.parse_args()
    main(args)
