/**
 * Created by Jim on 4/27/2015.
 */

function PreviewImage(num) {
    var oFReader = new FileReader();
    oFReader.readAsDataURL(document.getElementById("uploadImage"+num).files[0]);

    oFReader.onload = function (oFREvent) {
        document.getElementById("uploadPreview"+num).src = oFREvent.target.result;
    };
};