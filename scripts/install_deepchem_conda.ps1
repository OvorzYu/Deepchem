if ($python_version)
{
    echo "Using python "$python_version". But recommended to use python 3.6."
}
else
{
    echo "Using python 3.6 by default"
    $python_version=3.6
}

if($args.Length -eq 1)
{
    $envname = $args[0]
    conda create -y --name $envname python=$python_version
    conda activate $envname
}
else
{
    echo "Installing DeepChem in current env"
}

# Install dependencies except PyTorch Geometric
$path = Join-Path $Pwd "requirements.yml"
conda env update --file $path
$path = Join-Path $Pwd "requirements.txt"
pip install -r $path
$path = Join-Path $Pwd "requirements-test.txt"
pip install -r $path
