// Delete all projects
var output = "";
var projectRoots = search.luceneSearch("TYPE:\"ds:projectFolder\"");

var projectsToDelete = new Array("capy");

var billingToDelete = new Array();

for (var i=0; i<projectRoots.length; i++)   {
    var projectRoot = projectRoots[i];
    for (a in projectRoot.children) {
        var project = projectRoot.children[a];
        var projectName = project.name;
        var projectTitle = project.properties.title;
        var deleted = false;
        if (projectsToDelete.indexOf(projectTitle) > -1) {
            billingToDelete.push(projectName + "_billInfo");
            var deleted = project.remove()
        }

        if (deleted) {
            output += "Deleted project " + projectName + " with title " + projectTitle + ".<br>";
        }
    }
}

var billingRoots = search.luceneSearch("TYPE:\"bill:billingRoot\"");

for (var i=0; i<billingRoots.length; i++)   {
    var billingRoot = billingRoots[i];
    for (a in billingRoot.children) {
        var billing = billingRoot.children[a];
        var billingName = "" + billing.name;
        var deleted = false;
        if (billingToDelete.indexOf("" + billingName) > -1) {
            var deleted = billing.remove()
        }

        if (deleted) {
            output += "Deleted billing " + billingName + "<br>";
        }
    }
}

output