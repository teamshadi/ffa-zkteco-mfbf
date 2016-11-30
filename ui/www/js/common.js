Array.prototype.unique = function () {
    var r = new Array();
    o:for(var i = 0, n = this.length; i < n; i++)
    {
    	for(var x = 0, y = r.length; x < y; x++)
    	{
    		if(r[x]==this[i])
    		{
//                alert('this is a DUPE!');
    			continue o;
    		}
    	}
    	r[r.length] = this[i];
    }
    return r;
}

Array.prototype.diff1 = function(compare) {
    return this.filter(function(elem) {return elem!=compare;})
}
