#!/usr/bin/env python3

from pathlib import Path
import re
import sys


TEMPLATE_DIR = Path("templates")


def render(template: str, variables: dict[str, str]) -> str:
    """Replace {{VARIABLE}} placeholders with supplied values."""

    pattern = re.compile(r"\{\{([A-Za-z_][A-Za-z0-9_]*)\}\}")

    def replace(match):
        name = match.group(1)

        if name not in variables:
            raise ValueError(
                f"Missing variable: {name}"
            )

        return variables[name]

    return pattern.sub(replace, template)


def generate(
    template_name: str,
    output_path: str,
    variables: dict[str, str],
):
    template_path = TEMPLATE_DIR / template_name
    output_path = Path(output_path)

    if not template_path.is_file():
        raise FileNotFoundError(
            f"Template not found: {template_path}"
        )

    template = template_path.read_text(encoding="utf-8")
    output = render(template, variables)

    output_path.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

    output_path.write_text(
        output,
        encoding="utf-8",
    )

    print(f"Generated {output_path}")


def parse_variables(arguments):
    variables = {}

    for argument in arguments:
        if "=" not in argument:
            raise ValueError(
                f"Expected NAME=value, got: {argument}"
            )

        name, value = argument.split("=", 1)
        variables[name] = value

    return variables


def main():
    if len(sys.argv) < 3:
        print(
            "Usage: generate.py TEMPLATE OUTPUT [NAME=value ...]"
        )
        print()
        print(
            "Example:"
        )
        print(
            "  generate.py page.html about.html "
            "TITLE='About' AUTHOR='Jane Doe'"
        )
        sys.exit(1)

    template = sys.argv[1]
    output = sys.argv[2]

    variables = parse_variables(sys.argv[3:])

    try:
        generate(template, output, variables)
    except (FileNotFoundError, ValueError) as error:
        print(f"Error: {error}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
