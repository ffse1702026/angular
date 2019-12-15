using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infini.AutomaticDivideTool.Utilities
{
    public class PNRViewException: Exception
    {
        public PNRViewException()
        {
        }

        public PNRViewException(string message)
            : base(message)
        {
        }

        public PNRViewException(string message, Exception inner)
            : base(message, inner)
        {
        }
    }
}
