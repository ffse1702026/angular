using Infini.AutomaticDivideTool.Utilities;
using System;
using System.Runtime.Serialization;

namespace Infini.AutomaticDivideTool.ExceptionHandler
{
    public class ResponseInValid : Exception
    {
        //Logger variable
        private Logger _logger = Logger.GetLogger();

        /// <summary>
        /// Initializes a new instance of the <see cref="BusinessLogicException" /> class.
        /// </summary>
        /// <param name="message">The message.</param>
        public ResponseInValid(string message)
            : base(message)
        {
            //_logger.Error(message);
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="BusinessLogicException"/> class.
        /// </summary>
        /// <param name="message">The message.</param>
        /// <param name="innerException">The inner exception.</param>
        public ResponseInValid(string message, Exception innerException) :
            base(message, innerException)
        {
            _logger.Error(message);
            _logger.Error(innerException);
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="BusinessLogicException"/> class.
        /// </summary>
        /// <param name="info">The information.</param>
        /// <param name="context">The context.</param>
        protected ResponseInValid(SerializationInfo info,
         StreamingContext context)
            : base(info, context)
        {
            // Implement type-specific serialization constructor logic.
        }
    }
}
