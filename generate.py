#!/usr/bin/env python3

from pathlib import Path
import re
import sys


TEMPLATE_DIR = Path("templates")
GEN_DIR = Path("gen")


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


def build_toc(
    template: str,
    variables: dict[str, str],
):
    ids = re.findall(r'<section id="([^"]+)"', template)

    toc = ''
    num = 1;
    for item in ids:
        toc += f'\n<li><a href=#{item}>0{num} — {item.title()}</a></li>'
        num += 1

    variables['TOC'] = toc


def build_paths(
    template_name: str,
    output_path: str,
) -> tuple[str, Path]:

    if template_name == '--gen':
        # this is pulling from the gen folder
        # and the output is the same base name as the input
        template_path = GEN_DIR / f'{output_path}.html'
        output_path = Path(f'docs/{output_path}.html')
    elif template_name == '--index':
        template_path = Path(f'docs/index.html')
        output_path = Path(f'docs/index.html')
    else:
        template_path = TEMPLATE_DIR / template_name
        output_path = Path(output_path)

    return template_path,output_path


def generate(
    template_path: str,
    output_path: Path,
    variables: dict[str, str],
):
    if not template_path.is_file():
        raise FileNotFoundError(
            f"Template not found: {template_path}"
        )

    template = template_path.read_text(encoding="utf-8")
    build_toc(template,variables)
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


def default_variables(
    output: str,
    variables: dict[str, str],
):
    variables['WEBNAME'] = 'Trenches of Honey'
    variables['WEBDESC'] = 'Independent research'
    variables['FILENAMEBASE'] = output


def parse_variables(output,arguments):
    variables = {}

    for argument in arguments:
        if "=" not in argument:
            raise ValueError(
                f"Expected NAME=value, got: {argument}"
            )

        name, value = argument.split("=", 1)
        variables[name] = value

    default_variables(output,variables)

    return variables


def main_core(
    template_path: str,
    output_path: Path,
    variables: dict[str, str],
):
    try:
        generate(template_path, output_path, variables)
    except (FileNotFoundError, ValueError) as error:
        print(f"Error: {error}", file=sys.stderr)
        sys.exit(1)


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

    template_path, output_path = build_paths(template,output)
    variables = parse_variables(output,sys.argv[3:])

    main_core(template_path,output_path,variables)

    if template == '--gen':
        print('   also updating index')
        main_core(Path(f'docs/index.html'),Path(f'docs/index.html'),variables)


if __name__ == "__main__":
    main()
