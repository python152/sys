import os
from subprocess import check_call

c = get_config()

# Run all nodes interactively
c.InteractiveShell.ast_node_interactivity = "all"
c.InteractiveShell.colors="nocolor"

def post_save(model, os_path, contents_manager):
    """post-save hook for converting notebooks to .py and .html files."""
    if model['type'] != 'notebook':
        return # only do this for notebooks
    d, fname = os.path.split(os_path)
    check_call(['ipython', 'nbconvert', '--to', 'script', fname], cwd=d)
    check_call(['ipython', 'nbconvert', '--to', 'html', fname], cwd=d)

c.FileContentsManager.post_save_hook = post_save

# retina display 
# c.InlineBackend.figure_format = 'retina'

# maybe this is better addressed through %config 
# InlineBackend.figure_format = 'retina'

