function loadHTML(file)
{
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", file, false);
    rawFile.onreadystatechange = function ()
    {
                var allText = rawFile.responseText;
                document.write(allText);
    }
    rawFile.send(null);
}